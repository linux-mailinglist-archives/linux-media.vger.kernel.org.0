Return-Path: <linux-media+bounces-44438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67021BD9B15
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 15:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27B223BEBE4
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0E0314D35;
	Tue, 14 Oct 2025 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rws2QiQ2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6124E31352D;
	Tue, 14 Oct 2025 13:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447990; cv=none; b=HM3OKEEW0OFWp6vW9CiNv4wJAoLsP7n7yEo9MXh6G7zMdu7iGPXvuMzvIG/GgfcHBaXknZirwEEKaxx+dtviIGN0ICOhjZKYPQjVvu96WXcELqj/D/Zub6kn898Fu0SK+r8EtEUWOKlaNPmdHHnyE2o05rcumgy6DdBy5NdXcbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447990; c=relaxed/simple;
	bh=Nqq2/LuTW6vCVQBhBWXAS3bVVhvhJ4XHytcI3762lk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q8B0AZLmWtRkW6+3BgGvAuYFjEmBvv2uhWHfvV4M/iKCmbhcZ2uta9dyA+dRm9XetKJ/5IuZ/IU4kiVhuq2zezfFNxbvLtkMsFGH5qwy5582M/TiOXB9gKpkZrM6QVa5tTa5+UWw+seqSayockE9+s5TPAa6XcYGftMk1DeZAf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rws2QiQ2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DACFCC7B;
	Tue, 14 Oct 2025 15:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760447888;
	bh=Nqq2/LuTW6vCVQBhBWXAS3bVVhvhJ4XHytcI3762lk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rws2QiQ2mlXVkLzqn4GjbpbWhgrlDtsfF26I2zKC20X04INRl+R4Ex2Fz+/LIsedn
	 bebwuU9ONDn80IGacOojF77NIPNWxvWTOoPj+X+N5CSMPcdbaNYsk2vT072uTRS58r
	 4ArAyaDdAd4C13AWpK535pxdrvhcyHxxiebzlIio=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 14 Oct 2025 15:19:33 +0200
Subject: [PATCH for v6.18 v5 1/2] media: cx18: Fix invalid access to file *
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-cx18-v4l2-fh-v5-1-e09e64bc4725@ideasonboard.com>
References: <20251014-cx18-v4l2-fh-v5-0-e09e64bc4725@ideasonboard.com>
In-Reply-To: <20251014-cx18-v4l2-fh-v5-0-e09e64bc4725@ideasonboard.com>
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6363;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Nqq2/LuTW6vCVQBhBWXAS3bVVhvhJ4XHytcI3762lk0=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7k3xf8blaG4dnBMTnaHoYC5/nBSnQUaydWx5p
 NwcJpFG8iKJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO5N8QAKCRByNAaPFqFW
 PGgdD/wNxhWd/7yO6wb+5rlSobeTf73Wg4CARAD9rKUXnpxVctsO4YNTx7SQ9eKAjTE4m/1MENa
 USLJodUnjPFRGoMcVBu26FASBPgCKXRnDwj0bal9rOA5i/YBDXL3+BS9ih5CCRK7E667EO0ZFD4
 o/vIQjxOJNYC9RFzw1J8TRdTt0vHlzcvacwnTYrd7SymbSO20O8xCPP82eH/3ya3nHH+uAkS3Q0
 I6RxmI10mqbckcQw6w/KsA7ySsIct1i7CSmqVJ+YAcKfRSN/q4X7i0PrY+E7rgze0Jp06aTDRJF
 o/WjMSRa2enkxe/9o7tyEkconS2AGHNrdMHTCpG6PaaM1DKoLIBwxLlgTwhGk6j8w0/MANAYseW
 OQkC7UM56Nc0iztbN5rVFSM+BMARn/l00cW4eBtyHC3Gcv6Nu1ewZyT946y3fMS4ygMOjSVW6/9
 38yg1nCNzWXIl++KeSkE3TJxawPsn/i0zVVtFAezgYEcg/aNDwG2iCbquWGH1MxP8/8afcSDOr2
 zvuGW/BO1YFBVIIy5G3wJSILxbD+Gd3o1dG67jYwmvYdsHNgcqa1RMgJZuXdO37JwThQUUsZObG
 urKjxuWae3dcWedCszA+dH8ry3KQnZd60tExIS08FoDE4eXq6qoXa1eMEeIAAgl41nOn0LkpUCA
 Ab4zh19sVyR0VWQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Sice commit 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
all ioctl handlers have been ported to operate on the file * first
function argument.

The cx18 DVB layer calls cx18_init_on_first_open() when the driver needs
to start streaming. This function calls the s_input(), s_std() and
s_frequency() ioctl handlers directly, but being called from the driver
context, it doesn't have a valid file * to pass them. This causes
the ioctl handlers to deference an invalid pointer.

Fix this by moving the implementation of those ioctls to functions that
take a cx18 pointer instead of a file pointer, and turn the V4L2 ioctl
handlers into wrappers that get the cx18 from the file. When calling
from cx18_init_on_first_open(), pass the cx18 pointer directly. This
allows removing the fake fh in cx18_init_on_first_open().

The bug has been reported by Smatch:

--> 1223         cx18_s_input(NULL, &fh, video_input);
The patch adds a new dereference of "file" but some of the callers pass a
NULL pointer.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aKL4OMWsESUdX8KQ@stanley.mountain/
Fixes: 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
Cc: stable@vger.kernel.org
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/pci/cx18/cx18-driver.c |  9 +++------
 drivers/media/pci/cx18/cx18-ioctl.c  | 30 +++++++++++++++++++-----------
 drivers/media/pci/cx18/cx18-ioctl.h  |  8 +++++---
 3 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-driver.c b/drivers/media/pci/cx18/cx18-driver.c
index b62fd12c93c1a37ea6c8d3d48871028d81b33485..74c59a94b2b051b1585051e2e3ea3ee8fbd16630 100644
--- a/drivers/media/pci/cx18/cx18-driver.c
+++ b/drivers/media/pci/cx18/cx18-driver.c
@@ -1136,11 +1136,8 @@ int cx18_init_on_first_open(struct cx18 *cx)
 	int video_input;
 	int fw_retry_count = 3;
 	struct v4l2_frequency vf;
-	struct cx18_open_id fh;
 	v4l2_std_id std;
 
-	fh.cx = cx;
-
 	if (test_bit(CX18_F_I_FAILED, &cx->i_flags))
 		return -ENXIO;
 
@@ -1220,14 +1217,14 @@ int cx18_init_on_first_open(struct cx18 *cx)
 
 	video_input = cx->active_input;
 	cx->active_input++;	/* Force update of input */
-	cx18_s_input(NULL, &fh, video_input);
+	cx18_do_s_input(cx, video_input);
 
 	/* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
 	   in one place. */
 	cx->std++;		/* Force full standard initialization */
 	std = (cx->tuner_std == V4L2_STD_ALL) ? V4L2_STD_NTSC_M : cx->tuner_std;
-	cx18_s_std(NULL, &fh, std);
-	cx18_s_frequency(NULL, &fh, &vf);
+	cx18_do_s_std(cx, std);
+	cx18_do_s_frequency(cx, &vf);
 	return 0;
 }
 
diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index 0f3019739d03dab1ed8ba63f71134a5b64807c7d..0d676a57e24ec901f004e4b3765614b6142daf00 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -521,10 +521,8 @@ static int cx18_g_input(struct file *file, void *fh, unsigned int *i)
 	return 0;
 }
 
-int cx18_s_input(struct file *file, void *fh, unsigned int inp)
+int cx18_do_s_input(struct cx18 *cx, unsigned int inp)
 {
-	struct cx18_open_id *id = file2id(file);
-	struct cx18 *cx = id->cx;
 	v4l2_std_id std = V4L2_STD_ALL;
 	const struct cx18_card_video_input *card_input =
 				cx->card->video_inputs + inp;
@@ -558,6 +556,11 @@ int cx18_s_input(struct file *file, void *fh, unsigned int inp)
 	return 0;
 }
 
+static int cx18_s_input(struct file *file, void *fh, unsigned int inp)
+{
+	return cx18_do_s_input(file2id(file)->cx, inp);
+}
+
 static int cx18_g_frequency(struct file *file, void *fh,
 				struct v4l2_frequency *vf)
 {
@@ -570,11 +573,8 @@ static int cx18_g_frequency(struct file *file, void *fh,
 	return 0;
 }
 
-int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
+int cx18_do_s_frequency(struct cx18 *cx, const struct v4l2_frequency *vf)
 {
-	struct cx18_open_id *id = file2id(file);
-	struct cx18 *cx = id->cx;
-
 	if (vf->tuner != 0)
 		return -EINVAL;
 
@@ -585,6 +585,12 @@ int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
 	return 0;
 }
 
+static int cx18_s_frequency(struct file *file, void *fh,
+			    const struct v4l2_frequency *vf)
+{
+	return cx18_do_s_frequency(file2id(file)->cx, vf);
+}
+
 static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
 {
 	struct cx18 *cx = file2id(file)->cx;
@@ -593,11 +599,8 @@ static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
 	return 0;
 }
 
-int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
+int cx18_do_s_std(struct cx18 *cx, v4l2_std_id std)
 {
-	struct cx18_open_id *id = file2id(file);
-	struct cx18 *cx = id->cx;
-
 	if ((std & V4L2_STD_ALL) == 0)
 		return -EINVAL;
 
@@ -642,6 +645,11 @@ int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
 	return 0;
 }
 
+static int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
+{
+	return cx18_do_s_std(file2id(file)->cx, std);
+}
+
 static int cx18_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
 {
 	struct cx18_open_id *id = file2id(file);
diff --git a/drivers/media/pci/cx18/cx18-ioctl.h b/drivers/media/pci/cx18/cx18-ioctl.h
index 97cd9f99e22d9676d427a7e9e12fb572a91b2a82..42a8acd69735469af548d9e5ea95d60d786f83e3 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.h
+++ b/drivers/media/pci/cx18/cx18-ioctl.h
@@ -12,6 +12,8 @@ u16 cx18_service2vbi(int type);
 void cx18_expand_service_set(struct v4l2_sliced_vbi_format *fmt, int is_pal);
 u16 cx18_get_service_set(struct v4l2_sliced_vbi_format *fmt);
 void cx18_set_funcs(struct video_device *vdev);
-int cx18_s_std(struct file *file, void *fh, v4l2_std_id std);
-int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
-int cx18_s_input(struct file *file, void *fh, unsigned int inp);
+
+struct cx18;
+int cx18_do_s_std(struct cx18 *cx, v4l2_std_id std);
+int cx18_do_s_frequency(struct cx18 *cx, const struct v4l2_frequency *vf);
+int cx18_do_s_input(struct cx18 *cx, unsigned int inp);

-- 
2.51.0


