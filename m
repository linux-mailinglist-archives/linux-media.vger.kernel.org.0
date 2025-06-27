Return-Path: <linux-media+bounces-36125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FF3AEBCCD
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 18:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D60E7AC454
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 16:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123C42E9ECA;
	Fri, 27 Jun 2025 16:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUCSHoFY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636C81A316E;
	Fri, 27 Jun 2025 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040313; cv=none; b=miGD1bi92DmRGKRIZY6FA0NQrHi7BDBxneIhAnjgkcPJiHIM8fUXyjm9YTVDTIlpY48XT1pSTDJQU9kv8E7u3p8KVHyNi3nKuZSEluZT5eEB0e0pBvh0KKQTu135FFr1BRvinSQdHjXR52VJ4jcfateEjHZ8zBWBzotIjpxRonw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040313; c=relaxed/simple;
	bh=6yeSLlUWG2ViTe2oO5VkJbCr3BcK0z6zXXc0F+BsewQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xyxag1fJlzC3NkPrZDO+uDbCKehakjraubvCfciXAabBM4a1zo9q0NoqL9oK3OYa5G4MHfVl99gupMrPKY5wREU+CHojCicsYdYM5oyYvxSetnst0oW0GFVcHgZN9UGG8AnZg03W2qyg3yljxv5UOYbMK63TVyJI4O4ccZQBeZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUCSHoFY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA94C4CEED;
	Fri, 27 Jun 2025 16:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751040312;
	bh=6yeSLlUWG2ViTe2oO5VkJbCr3BcK0z6zXXc0F+BsewQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DUCSHoFYwrR1adukBmbRAwYE1LktakUEjlPhZ4sFmvwhcKJrfJjztWj+ISKnI+UDu
	 QCFcAmpn/qMLIGs4gJAjGHXka+ur4G9keQSvRGjXaHc+D9ZyVRbRHbDgDR4/ux9N37
	 vvV0qncLWjRCf88D6fXAgL5QspLRjtw+ETIPu3hamXQb1UHScwoGmK3qMOoUe1Irp0
	 oWXwAGNKDMD40gHSlKTfr2ljshosXTUjvRfNIYRBGgwoFwl9D20up/v5/Mw3w9dxuN
	 sdto5AxYUezfK/aDEL0Nzw7f0mlAd0E1IKNu0EA2o1aNOCuxtJeXuoinR4Ifc2GEL4
	 6pSc2/MeExYdw==
Message-ID: <e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org>
Date: Fri, 27 Jun 2025 18:05:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: media: atomisp: apply clang-format and fix
 checkpatch.pl errors
To: LiangCheng Wang <zaq14760@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, llvm@lists.linux.dev
References: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27-Jun-25 4:56 PM, LiangCheng Wang wrote:
> Applied clang-format to the entire AtomISP driver to improve code consistency,
> readability, and adherence to Linux kernel coding style.
> 
> Additionally, manually fixed all checkpatch.pl-reported ERRORs across
> the driver, including:
> 
> - Macro definitions with complex expressions now wrapped in parentheses
> - Removed unnecessary parentheses in return statements
> - Avoided initializing globals to zero
> - Fixed invalid spacing around unary operators
> 
> This patch only includes formatting and stylistic changes with no functional logic modifications.
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Link: https://lore.kernel.org/all/aFwSgCtrK7DH3pIw@smile.fi.intel.com/
> Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
> ---
> This patch applies clang-format to the entire AtomISP driver and manually
> fixes all checkpatch.pl-reported ERRORs. The intent is to improve code
> consistency and align with kernel coding standards.

I'm sorry but this patch is totally un-reviewable because it
is much much too large.

For starters the automated part done by clang-format and
any later changes done by hand should be split out into
separate patches.

Ideally I should be able to recreate the clang-format
patch my self, so that I can apply it without needing
to manually check that any unintentional code changes
have been added.

> Formatting and error fixes include:
> - Replacing space-based indentation with tabs
> - Wrapping complex macros in parentheses
> - Removing redundant return parentheses
> - Avoiding unnecessary zero-initialized globals

All of these should be separate patches, 1 patch
per change in your above list.

Also there are many many undesirable changes in here, just
a few random examples:

--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -19,50 +19,50 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 
-#define GC0310_NATIVE_WIDTH			656
-#define GC0310_NATIVE_HEIGHT			496
+#define GC0310_NATIVE_WIDTH 656
+#define GC0310_NATIVE_HEIGHT 496
 
-#define GC0310_FPS				30
-#define GC0310_SKIP_FRAMES			3
+#define GC0310_FPS 30
+#define GC0310_SKIP_FRAMES 3
 
-#define GC0310_FOCAL_LENGTH_NUM			278 /* 2.78mm */
+#define GC0310_FOCAL_LENGTH_NUM 278 /* 2.78mm */
 
-#define GC0310_ID				0xa310
+#define GC0310_ID 0xa310
 
-#define GC0310_RESET_RELATED			0xFE
-#define GC0310_REGISTER_PAGE_0			0x0
-#define GC0310_REGISTER_PAGE_3			0x3
+#define GC0310_RESET_RELATED 0xFE
+#define GC0310_REGISTER_PAGE_0 0x0
+#define GC0310_REGISTER_PAGE_3 0x3

Before everything was nicely aligned into a singel column, now
it is harder to read + we get lots of churn which we don't
want.

-	{ 0x51, 0x00 },
-	{ 0x52, 0x00 },
-	{ 0x53, 0x00 },
-	{ 0x54, 0x01 },
-	{ 0x55, 0x01 }, /* crop window height */
-	{ 0x56, 0xf0 },
-	{ 0x57, 0x02 }, /* crop window width */
+	{ 0x51, 0x00 }, { 0x52, 0x00 }, { 0x53, 0x00 },
+	{ 0x54, 0x01 }, { 0x55, 0x01 }, /* crop window height */
+	{ 0x56, 0xf0 }, { 0x57, 0x02 }, /* crop window width */

No we don't want multiple register inits on a single line.

@@ -271,9 +265,11 @@ static int gc0310_write_reg_array(struct i2c_client *client,
 	int i, err;
 
 	for (i = 0; i < count; i++) {
-		err = i2c_smbus_write_byte_data(client, reglist[i].reg, reglist[i].val);
+		err = i2c_smbus_write_byte_data(client, reglist[i].reg,
+						reglist[i].val);
 		if (err) {
-			dev_err(&client->dev, "write error: wrote 0x%x to offset 0x%x error %d",

The original line here had a length below 100 chars, so it was fine
and log messages are allowed to go over the length limit

+			dev_err(&client->dev,
+				"write error: wrote 0x%x to offset 0x%x error %d",
 				reglist[i].val, reglist[i].reg, err);
 			return err;
 		}

@@ -317,8 +313,8 @@ static int gc0310_gain_set(struct gc0310_device *dev, u32 gain)
 
 static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 {
-	struct gc0310_device *dev =
-		container_of(ctrl->handler, struct gc0310_device, ctrls.handler);
+	struct gc0310_device *dev = container_of(
+		ctrl->handler, struct gc0310_device, ctrls.handler);
 	int ret;
 
 	/* Only apply changes to the controls if the device is powered up */

This just is making the code outright harder to read + it will actually
introduce a checkpatch warning!

And these are just a few examples from the first file touched by
the series...

E.g. I also saw some changes from: "foo - 1" to "foo-1" which actually
breaks the coding style, instead of fixing it.

All in all it looks like this needs a lot more work because ATM
it is just causing a ton of churn and not necessarily making
things better.

Note specifically for the gc0310 code I've a patch series which
fixes some last issues and after that it is ready to move out
of staging:

https://lore.kernel.org/linux-media/20250517114106.43494-1-hdegoede@redhat.com/

So please don't touch the gc0310 code at all, it already has no
known style issues and any changes will not be merged since that
would cause the need to resolve conflicts with the linked series
which is undesirable.

And for other sensor drivers under drivers/staging/media/i2c/
I plan to simply write new clean drivers from scratch using
the info from the old drivers and then retire the old ones,
because the gc0310 work (lots of work was already done before)
has shown that slowly evolving them into mainline ready drivers
is much much more work then just starting from scratch.

So please don't touch anything under:
drivers/staging/media/i2c/

For just code-style changes since that is all planned to go
away anyway, so that is just wasted effort.

Regards,

Hans




