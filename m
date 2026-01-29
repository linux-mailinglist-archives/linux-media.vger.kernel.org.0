Return-Path: <linux-media+bounces-51791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNsPKeyye2nNHwIAu9opvQ
	(envelope-from <linux-media+bounces-51791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 20:20:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C19B3DF1
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 20:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADD0A3019928
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 19:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB232F8BD0;
	Thu, 29 Jan 2026 19:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFGknK9c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECE57080E
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 19:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769714407; cv=pass; b=AcsWdGDMYKz1aX5+MOQpfXCwvGSJC1Uoec9+/ZfyM+DfxAnfzGJygbnpk9ai3rAvVVo9MEPZSTMRjlhF+QG/ymu/LgY0iZZbfxR8O1hs68JzcVBP1Wo2NjX7F33s8ro8MvGVzAyAJ0o51g4dUY3jCYP3MyjwQ25eDKXTzrxCXzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769714407; c=relaxed/simple;
	bh=MvxlhkyeUHwJAGYLzX2e1HtLPIDIfLSKlo3TkW4qMp4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=emSdaAtF1XtWiCrY5zOVtzQOdquGluZdV/9yAs1CW7Tm06bf0ADNeUFPvdW5MDpioGxBm730fnzksjHGz+GCSFltBzqd44bimbYyMOqlusOjk89CKYdi9ii/1J2n35uaO1PuUCK+DGTP4hIdIPzhNrBDBU57EuQ9AF1ti4r3HZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFGknK9c; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59de66fda55so1542449e87.3
        for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 11:20:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769714404; cv=none;
        d=google.com; s=arc-20240605;
        b=NdUDBNSH2h+IXMwwQPj1SXyoV8Sq0BcdiQemkAQOKFYTpLXEIQ3nx3eHBu5pTyHlyI
         SKTvHC6B2Ru/RptNCmOgv7cRZbLpNXZGCx+RrNS/Bi2LydbFPTB3+TQ3CJbFi2LHQ9zF
         YSM+4zkR1zuC6SNOIVgihPOk5Wyu3FoOHfJm7e7pKASvMZK3YKwC2Dev4rMgH2H8vxYy
         aPbBc2k29uU4qcoA1zRIAGWCsUD3Z4ghW0QpZHpZuE6cwXnJMnb/HsIgNcKF4HLUrfz8
         TOy8XViBXV4X/1nH6mwqndSnXFL/Rm2yzSxxbWjoyG6pmO4UB7L0yC/zUm0Or5pQ9eRa
         5OHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=KkRcV35sCa7ky29vnzZqEqFZ8wwISj4c9bz225ZTlj4=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=FdJ6CUYqT6C8ZwNqhg/HKIJLyYRj5anNnx+bgGmzNOrOTLxNuiDGyHo9C4e4673kiH
         zRyF7CTcsyrLl632Rc/Z8t6JSwX8ZdZ8bQUwxUr1b+9wsZwCUBWtNIM86Z8z5ozhPqHI
         iAQb1fvIyEj7FWnqnqv9LTfjGhOqr1B4vsEHBTjVfwx4FKJ62lTqbEi8ZrFPlBDRX1Bf
         6bChuAzxDUpgQiBUNocq5ymuEDFiEe5vqu+cOsr+hRCfs+sLDtzbR9cT191/1pvd7P3F
         +p8EqDWVV6euHR2Jfxjjr0dYiG7tlsQvJt8ngnI3Xylxj09I2QYiFeTJvtAD59W3/e8R
         yKEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769714404; x=1770319204; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KkRcV35sCa7ky29vnzZqEqFZ8wwISj4c9bz225ZTlj4=;
        b=JFGknK9cMF/UkLLZ9O6qzANvtgK5Qr/wMQB3ZeXDmMW3JKdgB8mYKQCHMHWu7jrJ0b
         uu0kSgzd3jVb7NVFjSVSYlCPk6h5G12fJpIP/3YSpHX4RbkYK7ZL9yZ9KS52+9SHlWA2
         1jNw4c17RW3V9UcPTyUCTjROW8O+nEu38xw7UoF4n5biFrowfawFf1ew3CnBbvivXV5z
         0RHfJPllt5Fig1ug2PaFqgyZmHvP1VgsxFSX2HoV8TMugm8Bn3xBewxXep/qGVSGghgn
         XBZRw9ODN5jOZOSrcZZFGIEf+qtYUAvOU9CmfnS0NeZl+GAwYYinr85XtbLyby8Wl+EI
         O9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769714404; x=1770319204;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkRcV35sCa7ky29vnzZqEqFZ8wwISj4c9bz225ZTlj4=;
        b=GxARNkMGi7SbxeJ1lnG9qYTn8v4mHjJasarhDZbXbrb2IBLGTzcOMX9Twd15boz1A+
         2iklDgLPgLK6IBFXLpmtgfeOqfcKnM/IgQYl2Mu29h1DFrZ+9jiPYOAGKGU0a4GPXC32
         UrMz7+Jfbiut1HnS9oFv9DGOvFST64JXqlxgwJR9Svo7zxiOwt7uFnWEQehNXadzw3BW
         BDWi8ykL1RspYTdosN82tjIG6rHj8y1UIpB6Z/AGTw/PjzHHjNV5TI7dp3AC7qajJjvt
         /tea8E1BUTgVveE4pjoE9RlR9+KwMpy87/EodJjnP9XDH4ZzAq0uLRcMxt1NGBjxWMxp
         GVbA==
X-Gm-Message-State: AOJu0YxRANd2SW6amaebIxNz9Gsz2kXKup+osSEo0eAa+xUvF3kkGqk/
	SbPYBDhowgYWFIg2XewerEXeqfxW3AXrYmsaH0w+o1muW0rvSThoeUu7SCwKhdJ6tO2uQ/jgasI
	uJqr2uCxSeEjjpNWrl5I2JOnYWAKiSjguVIMR3jaBbWaO
X-Gm-Gg: AZuq6aKOJhJl6fgZzdPsmBIbtvGWXfL/WPD4+/bJEXfDBsFUvYjj+a/XZrR4c3kcXRN
	Un9YswqN9gRuQJfRZuU2TZrio9kH2jN2Wg9Sb2Ba3SKmDbY+xzLPVAsEjAGclfo+8Ksg7VfUoCn
	AbD/mOJ430KMPwG5/tFIc8DZICRj+GVXdZS/1Va51gxZ4cHgt8fDv1Mfk0epDRSpXLO+xZFqvQe
	6RaIymiAyZ0jSr2SF5G1kTkfnwB4XdEhse9lP0OAnvvigLdDfto6QKhrD7Tgvs8LTTqIDI=
X-Received: by 2002:ac2:4f07:0:b0:59d:c4b1:3993 with SMTP id
 2adb3069b0e04-59e163f5815mr79875e87.2.1769714403884; Thu, 29 Jan 2026
 11:20:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Denis Yasyuchenya <d.s.yasyuchenya@gmail.com>
Date: Thu, 29 Jan 2026 22:19:52 +0300
X-Gm-Features: AZwV_QhcxEA5-ftseTMSkEOGmqn5fJas0vae5oFrt0kelgX8bFD-FpTwN2vbSME
Message-ID: <CAKP_te-WT+HTEyhSvQ3snEOaTp5B1OUL18JjuzO238=_fTOuXQ@mail.gmail.com>
Subject: [PATCH] media: ov02c10: Add support for 26 MHz external clock
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-51791-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dsyasyuchenya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,znn.by:email]
X-Rspamd-Queue-Id: 07C19B3DF1
X-Rspamd-Action: no action

Some platforms (e.g. Samsung Galaxy Book with Intel IPU6) provide a 26 MHz
external clock for the OV02C10 sensor, while the driver currently only
accepts 19.2 MHz. This causes probe to fail with "external clock 26000000
is not supported".

Add support for 26 MHz by introducing OV02C10_MCLK_26MHZ and accepting
both 19.2 MHz and 26 MHz in ov02c10_probe().

Tested on Samsung Galaxy Book with OV02C10 sensor and 26 MHz clock.

Signed-off-by: Denis Yasyuchenya <ceo@znn.by>

--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -17,7 +17,8 @@
 #include <media/v4l2-fwnode.h>

 #define OV02C10_LINK_FREQ_400MHZ 400000000ULL
-#define OV02C10_MCLK 19200000
+#define OV02C10_MCLK_19_2MHZ 19200000
+#define OV02C10_MCLK_26MHZ   26000000
 #define OV02C10_RGB_DEPTH 10

 #define OV02C10_REG_CHIP_ID CCI_REG16(0x300a)
@@ -568,8 +569,10 @@ static int ov02c10_probe(struct i2c_client *client)
  if (IS_ERR(ov02c10->img_clk))
  return dev_err_probe(ov02c10->dev, PTR_ERR(ov02c10->img_clk),
      "failed to get imaging clock\n");

  freq = clk_get_rate(ov02c10->img_clk);
- if (freq != OV02C10_MCLK)
+ if (freq != OV02C10_MCLK_19_2MHZ && freq != OV02C10_MCLK_26MHZ)
  return dev_err_probe(ov02c10->dev, -EINVAL,
      "external clock %lu is not supported",
      freq);

