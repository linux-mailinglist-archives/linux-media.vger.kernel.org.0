Return-Path: <linux-media+bounces-19829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 939B79A34B6
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54BF82810F0
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C47A188906;
	Fri, 18 Oct 2024 05:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwyXULlj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2985A17CA17;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230807; cv=none; b=nMtbo/I7n4nVqjDzgpXVhDhqWtKNw9ZEw/nKelRC2uY2dQqeyiknyjgg4ZjkgNT2eVKE62fdsqURtViuznx0X/Lo2WUCLyRrP5vlEBWsZ1L5R0rdQuoIMFr9SgeBP8nEZuLpV4shUFOT2m1PoW9RgmbncMXEXZRqIJseFas5tgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230807; c=relaxed/simple;
	bh=hh6XlP2FkrU4iOsCrEKk8cmtfbZFCQUlDjidB8N3EOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HTDDj4v1lt5gWEFD5yaAnebBww+sQX+fY+Ti57NpPIMvpsM+sJjlApVkkCTAkyTrGdxQHAPKdAK4p/OVe88YHbpNCXI38JDVl+82803TTL77NtJqfo10zaSH3Ao7cF3fDbeGoHrOdWGN+ACS2xIUqVC+JZKMgBe+JivVV8cdvZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwyXULlj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B941CC4CED0;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729230806;
	bh=hh6XlP2FkrU4iOsCrEKk8cmtfbZFCQUlDjidB8N3EOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RwyXULljLrWbKexuR5WtQqCEwRMJxftwfe8Sh/gCzRKeo5RD9L7LsH/qBhXA/tBuO
	 cfCBu9zIvSAYU0FeHYUAPtkOWdJR+jadIqeY+IQwnUESbgj5kXK09KhYFSFQeYj1y5
	 fUc5Dp9QXQpxtcEmJqQiGL7dWtsogxtQpY703lI8DTnbcAmaOap1al510SyquhxOa0
	 e+cvCvNaLm88qfWx2414bkZlcyFWpSAIFQGLggHiUgtJx2qNZntM+vN48OQUxl6j45
	 qF2W3jNPg5RRP8pCCOUl2JpV8lnQIHOHRaxMYgDh98cSkZTMiq9OpKXC1OIVnU5j2X
	 Jaj/urBTVGoPg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t1fvQ-00000005Mej-2YXS;
	Fri, 18 Oct 2024 07:53:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 13/13] media: pulse8-cec: fix data timestamp at pulse8_setup()
Date: Fri, 18 Oct 2024 07:53:15 +0200
Message-ID: <8fbcb2e2d05bc394fd4e15d44cc78b531f69ee8f.1729230718.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729230718.git.mchehab+huawei@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As pointed by Coverity, there is a hidden overflow condition there.
As date is signed and u8 is unsigned, doing:

	date = (data[0] << 24)

With a value bigger than 07f will make all upper bits of date
0xffffffff. This can be demonstrated with this small code:

<code>
typedef int64_t time64_t;
typedef uint8_t u8;

int main(void)
{
	u8 data[] = { 0xde ,0xad , 0xbe, 0xef };
	time64_t date;

	date = (data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
	printf("Invalid data = 0x%08lx\n", date);

	date = ((unsigned)data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
	printf("Expected data = 0x%08lx\n", date);

	return 0;
}
</code>

Fix it by converting the upper bit calculation to unsigned.

Fixes: cea28e7a55e7 ("media: pulse8-cec: reorganize function order")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/cec/usb/pulse8/pulse8-cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index ba67587bd43e..171366fe3544 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -685,7 +685,7 @@ static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
 	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 4);
 	if (err)
 		return err;
-	date = (data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
+	date = ((unsigned)data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
 	dev_info(pulse8->dev, "Firmware build date %ptT\n", &date);
 
 	dev_dbg(pulse8->dev, "Persistent config:\n");
-- 
2.47.0


