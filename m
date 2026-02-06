Return-Path: <linux-media+bounces-52302-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN6/CFLvhWlvIQQAu9opvQ
	(envelope-from <linux-media+bounces-52302-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:40:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6B4FE496
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 951A4306949B
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 13:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93884367F56;
	Fri,  6 Feb 2026 13:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oMg6a6Ic"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA42A3A0B2F
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 13:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385147; cv=none; b=hWAYRFB7fPxXZ2xRATDEBd1VaD1CZj0uJozGrdKlYzjwNNFIXDS3w2K3MaOLMbdotsHKvVod750xWs9B8k6MuCtcJKGw1Jd5o++sPuRO/4Ld7H+j3AtX3iYPjwPCQlWBZr2dv2kHTqWMDbBvScJiYKtkLZ1ghETT2xf7rldENVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385147; c=relaxed/simple;
	bh=nJf+oEcEmXaOW9KZFmSY2SPCRRKJ69mMGa0q9XzdjBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uk4YzXUmQ/A6MOYqCQR3eJql/umHlVS0tPRpiPLBxGUyH4F14EDcJGkmwV8WIkCRwUMjw9gO6p0R4NyUPTVphUvx8W9r0Cchl/uw64yT5CErbYM9Jmud7v1PvLNd1kcdvLDOagu3wNaX6+D5VPD5QiCDPc7YFu3G4UyfMpF93fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oMg6a6Ic; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso21838385e9.1
        for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 05:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385145; x=1770989945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SByblG/xWpvmp/nxolcVgq0FDfurU60ZeneSuFWn46c=;
        b=oMg6a6IcoyYb0CeIaYZiJp3Fyou1H4YLsQnaFTowASc7CUKsMX8CCMySCiysEYPurP
         2CibxuNYYvojUHbV2t3Ifs1Fl1zHOw2TrbT3pZ+PDIIOs3btjBybgoBAE/8NthOx8mvk
         zS1/6S2+0OZnh3ITUQLls4E9nXWNL3ICNYScttFzeUNCVYMGv8s+vJ+gXDD5V9/46/Lj
         Rg7dQbOCDfLpD3QlGZYqp9VktXWqkI0Ppl5RSuXMDcNkdvPeKhsez6Wc7rits74SyEHE
         xNpmYMWTGPpdGT1Nkgm2AtFMDREQGD+gJkYqIMVOlWW11QuL9MnVo1GGY7tszOOngOEk
         oFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385145; x=1770989945;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SByblG/xWpvmp/nxolcVgq0FDfurU60ZeneSuFWn46c=;
        b=lGjfJOWkHUdsTnxN1eFgyEDKFGsEV4nYH9Td8tQH3TRUxGu91418imSEQV2dmu02mK
         9I7tk8MUAJW3nFqx0r5VxQ/RIR7NdcU7H0gUp0Lx5mr/sHrfP/Qb8w2bj+s2yjJXtvUi
         OFjowUjGLjw7c4r/7ujW91IbtD8FBIerK5iDCzV0thPp9nDTtjXuxaktMR6M8BCZCP6O
         GHVRJOG5bbH0kF2bnZ2BOOC1qvr3XxgLcUI5mF7bzgL7OuHYzywEsTqB9mY/AnWDSjuY
         /CbwTiUsFCjyQMYpFoeuG3BmjQDVq66X3adci1GY4ZG6zg8zwfPWByULM7FYV3xWExdL
         j0NQ==
X-Gm-Message-State: AOJu0YxiO8D0KPOxZ/AlZ5Et9tDmtSxlwdEnewgsgtPacldHKdppj3li
	iuN9OE5vBdFAI+mofJItF1oNFN82LLHZ8OvL6El2BFJKCH663UXTof5caM6zufKf4r8=
X-Gm-Gg: AZuq6aKfMUGM3yuftPEEMkhBn45wL5jZ/WtPuwMG2UU1lWXkqZW8DwFBtrjdzDQPYfL
	c2h5BtZ3LCsU6lToFhsNWPva/PyvLAINP7JqtaTBRavSNvCAG8d6d0OP8RNTs64qPYUp98C07Ly
	HfOH3Q0KZ1T6ti2o3ikpftwumRN9fTASBQtbFWt+MDDsIKEQu7K6ZEyYq5lcgtP5APGpTgI8n4n
	LVr7UYo/9M1w5h+fOofo6s3SXwoAXl0aWLUgwJmO5JehLb66dI8f2Nmd91kAMEwN0I4367DmFX9
	h62AOcJmQ6a2UhqtxiQTxLnW24A0cGJru+/e6Nn5ieGqFEcDbcpcmQrO7g1ity637j3y24k0Wkg
	UNr2fc5f3Clt1VMughv4wg4t7THvACQfP4r4XGA0bizGHwdJiMKEb0YlVg6t6gzb4d6J74Qz0WG
	nMZEfzXMq1dvzJYdrd
X-Received: by 2002:a05:600c:492f:b0:47d:7004:f488 with SMTP id 5b1f17b1804b1-48317917840mr57197425e9.10.1770385144973;
        Fri, 06 Feb 2026 05:39:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206cc543sm52806025e9.4.2026.02.06.05.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:39:04 -0800 (PST)
Date: Fri, 6 Feb 2026 16:39:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] media: synopsys: add driver for the designware mipi
 csi-2 receiver
Message-ID: <aYXu9Sf4aEl8c3ym@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52302-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,stanley.mountain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F6B4FE496
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Michael Riesch,

Commit 355a11004066 ("media: synopsys: add driver for the designware
mipi csi-2 receiver") from Jan 20, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/media/platform/synopsys/dw-mipi-csi2rx.c:307 dw_mipi_csi2rx_enum_mbus_code()
	warn: array off by one? 'csi2->formats[code->index]'

drivers/media/platform/synopsys/dw-mipi-csi2rx.c
    286 static int
    287 dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
    288                               struct v4l2_subdev_state *sd_state,
    289                               struct v4l2_subdev_mbus_code_enum *code)
    290 {
    291         struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
    292 
    293         switch (code->pad) {
    294         case DW_MIPI_CSI2RX_PAD_SRC:
    295                 if (code->index)
    296                         return -EINVAL;
    297 
    298                 code->code =
    299                         v4l2_subdev_state_get_format(sd_state,
    300                                                      DW_MIPI_CSI2RX_PAD_SINK)->code;
    301 
    302                 return 0;
    303         case DW_MIPI_CSI2RX_PAD_SINK:
    304                 if (code->index > csi2->formats_num)

This should be >=.

    305                         return -EINVAL;
    306 
--> 307                 code->code = csi2->formats[code->index].code;
    308                 return 0;
    309         default:
    310                 return -EINVAL;
    311         }
    312 }

regards,
dan carpenter

