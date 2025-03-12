Return-Path: <linux-media+bounces-28098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA25A5E43B
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 20:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC337189DE6F
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 19:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B84B257458;
	Wed, 12 Mar 2025 19:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TQs37bjG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m7NpPFn0"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341241D79A0
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 19:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741807079; cv=none; b=SnECZCzqHgeIlf/Lve0cre/QvIF/l/9hROM7el8dKvnTryAF02zV86r/RYXrGMJNwC7yC62g2l4Phzz1xXOVJPHSCOIA0ZWBvTTCFcD/D5vXsWZtwHcoIMGXRJAP8eFl6yAIjN5KFytrizgsTlE9aP7BQERkqQ2nUQPldDk0EXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741807079; c=relaxed/simple;
	bh=HaOFT3lhApPLTfKPgJ6XrlzbIh0UaDJvvhL8ppoe3iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nV0uYEpEMAYIDmIscSP+Mb+GKIwQcqx9eUeYEFAHA2Ez1hThxb1Kaxd/hquRSPahmbPMeFXotlG3hmfBrohYTTdTbrJKhl7enYW4LIoa/Tg9hu+o2En2wQkXJZ6gBPjY7ab1Sf12piXcVBITuT19unQhQB9NCZe8OXPDZHYIrps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TQs37bjG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m7NpPFn0; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 38D39254026B;
	Wed, 12 Mar 2025 15:17:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 12 Mar 2025 15:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741807075;
	 x=1741893475; bh=cPk2zmLov+kkqfB3IW9AUhosTKimt/ZAwgVyB1qE4QE=; b=
	TQs37bjGQ65sPLA5QI3bE9Gbq6hnBhc7g6HXCjE21AUGiGdDkQJL7nyssjLYKOrQ
	+/EPLT2+gpIDkvGYVys/vwBpeR0G2BqqlisAwmDQi8SM2U3TWizBhPVrbxmQpZU8
	d6BSqhJoEpryuuc5IjKKCYMLLf1K4wQzGsrLC1Tekn45so14ImR50SoLeLoNNZUn
	L6FOk0iFGrto99w0adJUjIBmShdgHAYm0LkQzeE4AZrPRknf4XSay0r6C9KHeT5/
	0vvOP2VM0HplLMAQ1GHWXvygqMLg+816iWVvHtIpDnojDIlFYuoY+J/ADKFTxvMU
	g2IB9QhoyCJ0fsAu2LOVZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741807075; x=
	1741893475; bh=cPk2zmLov+kkqfB3IW9AUhosTKimt/ZAwgVyB1qE4QE=; b=m
	7NpPFn0HfT3GJaqGD7rkiond/TAeKJk8tVPzTFcyxhlPXhXlJh9vJXQIL3JNzAep
	E1mJ02ft/4BE98Dc9bU9IpHsbjc0i/JDyt3bOEQp//Wxt0rBVsIcohhfMhnFLIg4
	+2RxQbQDIcJ9WBzRYKKSSkIg3RBB83Bfu8N+wVYXxxjYQa4PqwIy9Abpah+mFBW1
	id0mfkBVtJuqwjyWAgTqqG1QMQJQa7wpOpZ/OD9Uxm5YvecjmkbgWlBucBBjEluK
	bypt103ibvrHCEhKQKzYA0Rw83rQby2dg7PH5C+vj9xsX8rWFNvGMQsq3VYM0KxO
	5slh5GNaWqihUw5rWqKgA==
X-ME-Sender: <xms:4t3RZ7epOTwvSGIwUepfr271XY0ERyGrVoOof_snXnNDbKGSRqGpXQ>
    <xme:4t3RZxPJseEKZ6yY5IYqAbze3-a7fwmPXriY5VH6FChUAu2ZloAbYEeJekXgN7g4l
    qQHzVhj1s8FNjGPWhA>
X-ME-Received: <xmr:4t3RZ0gHPqKeh7ad31v54ojSIOrSuKuJPQCTEBzKQliG9VXP4ClYDQi4FJqoavsZlBIs81NjZknwY22FGj-g3z-cgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdehkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpedt
    jeegkeeiudffhefhgedugeefueekkeffgeeltdeifeekheejveeifeffheevueenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeegpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrg
    hrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgv
    ughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:4t3RZ881Nzom9QSZktRHtpPT_lidURhfh7p0gq7tI-JtAUREYH3vLA>
    <xmx:4t3RZ3un8byUcHaD6_OTHXP-AfQyxuufGmdgsHBvAX2DSQZhBIzjUg>
    <xmx:4t3RZ7Ftpx-taT8epQ-vO7YLwyv1Vo-K2vG8nmGH3RhZGJAeZalimw>
    <xmx:4t3RZ-NLoPbJte2duKchUmW5h3QOHFq_p7Vuo5Ha9ye3xNCdR4jkZA>
    <xmx:493RZxJUjKPvpdPhHn6m4keMp6h88uk634FuNF8wxVXn05khS5ljIvHh>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Mar 2025 15:17:54 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [raw2rgbpnm 1/3] Remove support for reading multiple frames from single file
Date: Wed, 12 Mar 2025 20:17:08 +0100
Message-ID: <20250312191710.1823147-2-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312191710.1823147-1-niklas.soderlund@ragnatech.se>
References: <20250312191710.1823147-1-niklas.soderlund@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The argument to enable parsing multiple frames from a single file (-n)
was accidentally removed in 2012 in commit [1], and only fixed in 2025
by commit [2].

This feature makes it harder to fix other issues found in raw2rgbpnm and
since it have been dead for ~13 years without anybody noticing likely
have no users, remove it instead of trying to rework it.

1. Commit 5b6e56e54a93 ("Sort option names alphabetically and rename -r to -f")
2. Commit b0a28987d2e3 ("Add missing option to getopt()")

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
---
Hello,

For what it's worth when I found and fixed this issue in [2] I was
working on something else and the missing n to optarg poped out. I have
no use-case for this feature so please don't count me fixing this in Jan
as somebody is using this feature.
---
 raw2rgbpnm.c | 55 ++++++++++++++++------------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 4cdef563e3c0..e5ed0af99070 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -146,17 +146,14 @@ static const int resolutions[][2] = {
 /* Read and return raw image data at given bits per pixel (bpp) depth.
  * size should be set correctly before calling this function.
  * If set to {-1,-1}, try to guess image file resolution.
- * If framenum is set to nonnegative value, assume that input file contains
- * multiple frames and return the given frame. In that case frame size must be given.
  */
-static unsigned char *read_raw_data(char *filename, int framenum, int size[2], int bpp)
+static unsigned char *read_raw_data(char *filename, int size[2], int bpp)
 {
 	/* Get file size */
 	unsigned int line_length;
 	unsigned int padding = 0;
 	unsigned char *b = NULL;
 	unsigned int i;
-	int offset;
 	FILE *f = fopen(filename, "rb");
 	if (!f) error("fopen failed");
 	int r = fseek(f, 0, SEEK_END);
@@ -168,7 +165,6 @@ static unsigned char *read_raw_data(char *filename, int framenum, int size[2], i
 
 	/* Check image resolution */
 	if (size[0]<=0 || size[1]<=0) {
-		if (framenum>=0) error("can not automatically detect frame size with multiple frames");
 		for (i=0; i<SIZE(resolutions); i++)
 			if (resolutions[i][0]*resolutions[i][1]*bpp==file_size*8) break;
 		if (i >= SIZE(resolutions)) error("can't guess raw image file resolution");
@@ -176,9 +172,9 @@ static unsigned char *read_raw_data(char *filename, int framenum, int size[2], i
 		size[1] = resolutions[i][1];
 	}
 
-	if (framenum<0 && (file_size*8 < size[0]*size[1]*bpp)) error("out of input data");
-	if (framenum<0 && (file_size*8 > size[0]*size[1]*bpp)) printf("warning: too large image file\n");
-	if (framenum < 0 && (file_size % size[1] == 0)) {
+	if (file_size*8 < size[0]*size[1]*bpp) error("out of input data");
+	if (file_size*8 > size[0]*size[1]*bpp) printf("warning: too large image file\n");
+	if (file_size % size[1] == 0) {
 		line_length = size[0] * bpp / 8;
 		padding = file_size / size[1] - line_length;
 		printf("%u padding bytes detected at end of line\n", padding);
@@ -186,14 +182,6 @@ static unsigned char *read_raw_data(char *filename, int framenum, int size[2], i
 		printf("warning: input size not multiple of frame size\n");
 	}
 
-	/* Go to the correct position in the file */
-	if (framenum>=0) printf("Reading frame %i...\n", framenum);
-	if (framenum<0) framenum = 0;
-	offset = framenum*size[0]*size[1]*bpp/8;
-	r = fseek(f, offset, SEEK_SET);
-	if (r!=0) error("fseek");
-	if ((file_size-offset)*8 < size[0]*size[1]*bpp) goto out;
-
 	/* Read data */
 	b = xalloc((size[0]*size[1]*bpp+7)/8);
 	if (padding == 0) {
@@ -210,7 +198,7 @@ static unsigned char *read_raw_data(char *filename, int framenum, int size[2], i
 				error("fseek");
 		}
 	}
-out:	fclose(f);
+	fclose(f);
 	return b;
 }
 
@@ -693,15 +681,13 @@ int main(int argc, char *argv[])
 	int size[2] = {-1,-1};
 	unsigned char *src, *dst;
 	char *file_in = NULL, *file_out = NULL;
-	char multi_file_out[NAME_MAX];
 	int format = V4L2_PIX_FMT_UYVY;
 	const struct format_info *info;
 	int r;
 	char *algorithm_name = NULL;
-	int n = 0, multiple = 0;
 
 	for (;;) {
-		int c = getopt(argc, argv, "a:b:f:ghns:w");
+		int c = getopt(argc, argv, "a:b:f:ghs:w");
 		if (c==-1) break;
 		switch (c) {
 		case 'a':
@@ -747,13 +733,9 @@ int main(int argc, char *argv[])
 			       "-f <format>   Specify input file format format (-f ? for list, default UYVY)\n"
 			       "-g            Use high bits for Bayer RAW 10 data\n"
 			       "-h            Show this help\n"
-			       "-n            Assume multiple input frames, extract several PNM files\n"
 			       "-s <XxY>      Specify image size\n"
 			       "-w            Swap R and B channels\n", progname, argv[0]);
 			exit(0);
-		case 'n':
-			multiple = 1;
-			break;
 		case 's':
 			if (parse_format(optarg, &size[0], &size[1]) < 0) {
 				error("bad size");
@@ -780,23 +762,20 @@ int main(int argc, char *argv[])
 	}
 
 	/* Read, convert, and save image */
-	src = read_raw_data(file_in, multiple ? 0 : -1, size, info->bpp);
+	src = read_raw_data(file_in, size, info->bpp);
 	printf("Image size: %ix%i, bytes per pixel: %i, format: %s\n", size[0], size[1],
 		info->bpp, info->name);
 	dst = xalloc(size[0]*size[1]*3);
-	do {
-		raw_to_rgb(info, src, size, dst);
-		sprintf(multi_file_out, "%s-%03i.pnm", file_out, n);
-		printf("Writing to file `%s'...\n", multiple ? multi_file_out : file_out);
-		f = fopen(multiple ? multi_file_out : file_out, "wb");
-		if (!f) error("file open failed");
-		fprintf(f, "P6\n%i %i\n255\n", size[0], size[1]);
-		r = fwrite(dst, size[0]*size[1]*3, 1, f);
-		if (r!=1) error("write failed");
-		fclose(f);
-		if (!multiple) break;
-		src = read_raw_data(file_in, ++n, size, info->bpp);
-	} while (src != NULL);
+
+	raw_to_rgb(info, src, size, dst);
+	printf("Writing to file `%s'...\n", file_out);
+	f = fopen(file_out, "wb");
+	if (!f) error("file open failed");
+	fprintf(f, "P6\n%i %i\n255\n", size[0], size[1]);
+	r = fwrite(dst, size[0]*size[1]*3, 1, f);
+	if (r!=1) error("write failed");
+	fclose(f);
+
 	free(src);
 	free(dst);
 	return 0;
-- 
2.48.1


