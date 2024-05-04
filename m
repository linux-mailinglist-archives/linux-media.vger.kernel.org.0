Return-Path: <linux-media+bounces-10763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2917E8BBAAD
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 13:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D80B8281E21
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 11:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FAA18C3D;
	Sat,  4 May 2024 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qYjPPjBc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9722033E
	for <linux-media@vger.kernel.org>; Sat,  4 May 2024 11:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714821875; cv=none; b=SUmOlKdG4zpuUyQ0t8rjrqNjC+8zDHuIKELWG6UVoAH0SyTyuotFlh2BcgS/F4yaFDkiSRkeMbAk8BbcTZG1tIR8eJVz0XomHvPuE1BG+6MIDCuLLzAAduMMS9r7LzJ74CdZ61Z3qnu3T+l14NzPeliEOiEGuF/zAwiKn0GcKL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714821875; c=relaxed/simple;
	bh=uREmRisy1X75NGa0TnsbQQCa29M433tIZVLLmZWwImM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKIufvk+OBW4raI77p6CoGqkpboxqQAGkP8op9CZzJT4xWMf2uZgwMrd6+hCeHzyhrLoCzcyJED4/7sFfP0ni7KYekPd/xNYsA6TAWUuqLYXPVQhjvpmZe+dT6N0FiqyAoEQCWlrFtHXsVQ/MPRP1SP/n+isF8E/++a3jg5KYeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qYjPPjBc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41b4ff362a8so5111415e9.0
        for <linux-media@vger.kernel.org>; Sat, 04 May 2024 04:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714821872; x=1715426672; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E2R2n7UgzMLexQAbd+8wC/WeVgHQ59/HgJzd4EQKDrY=;
        b=qYjPPjBctJSEYOqxXlDlRsvJ9qu3r6RP1f9O4Mza58p2+0pSPVSO9E3tMOJ5+pfBCm
         uwgx6LgzwC62ZM6ZJkRrPuglPYv5hvW5ppVppAB+fHnjpDXwmlpto7p9jf7MVOK4Mn2F
         NVBoDwhuJnG7VsILMhDP1n61Xi6yPK4SrkAlpx2bDOv52n/fFPiBvSpradFlwxQ3arfq
         18JGPRAQAZCfaYOmCg/DsUPgei+HMkyYAGc8YuRmw9txb/FvvG59eqNV+HOK7mbwFCXH
         JusL1mtta189tmUwr2scg3qwMY6NL3adhOu4pcIipA2wu69f0LRmbotgWhTTZlZY2XSc
         mHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714821872; x=1715426672;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2R2n7UgzMLexQAbd+8wC/WeVgHQ59/HgJzd4EQKDrY=;
        b=fE3cWb8YbevUQZ/ENOcO8d361xn+2QbAyFG2PapBZFcit++m7WI4vcfB3KaEsXJou6
         3qilNCTQAgltCxInLkLKPvuptkm4FAjX40xOvoZHFpzBS2l1zOSlVYkSW9Urvhb6SxjD
         YYUT4f6YdbKERWjMp4s3Wxv9aXoiwTgw3MJ28HOMDFsXvT8M2TmHfEvuumzP9hfkih30
         /7d551tapEg89O+6lpWvP1gxwKC/grJf3dCV9VFIhspX5yyg8msp56UabdVrLeQbi8S5
         L9/r0f2eqS5HRRvxzYo730ryDHQAsTxbwpe6ey2ZspvE/OqqsGBxHmzruglaspEFgfzd
         wwyw==
X-Gm-Message-State: AOJu0YytiqphRBHfxCTuSPAnOKQeMHOT6JncJApn17PtlfqdPpmjrM29
	1LxCpH6u5cNGzzpv95sG2Ec2ex2M4IqP+eMAXraj08kVvWZZoYekUtHgwJq+Btw=
X-Google-Smtp-Source: AGHT+IEImJ4+JjwcmMqtZcqwOmovAgDnpKC5E5tNUq1OXj9ylRufStikTQj5fxoHZvwzcWy7Bm4jkw==
X-Received: by 2002:adf:e504:0:b0:34a:4227:e9e8 with SMTP id j4-20020adfe504000000b0034a4227e9e8mr4695620wrm.47.1714821871425;
        Sat, 04 May 2024 04:24:31 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id s16-20020adfea90000000b0034de587ffebsm6042463wrm.4.2024.05.04.04.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 04:24:31 -0700 (PDT)
Date: Sat, 4 May 2024 14:24:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johannes Stezenbach <js@sig21.net>
Cc: linux-media@vger.kernel.org
Subject: [bug report] [PATCH] dvb: b2c2/flexcop driver refactoring part 2:
 add modular Flexcop driver
Message-ID: <e42e10a1-f414-40c1-a804-36bc67270088@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ This patch is 19 years old now...  :P  Sorry!  - dan ]

Hello Johannes Stezenbach,

Commit 2add87a95068 ("[PATCH] dvb: b2c2/flexcop driver refactoring
part 2: add modular Flexcop driver") from May 16, 2005 (linux-next),
leads to the following Smatch static checker warning:

	drivers/media/usb/b2c2/flexcop-usb.c:199 flexcop_usb_memory_req()
	warn: iterator 'i' not incremented

drivers/media/usb/b2c2/flexcop-usb.c
    178 static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
    179                 flexcop_usb_request_t req, flexcop_usb_mem_page_t page_start,
    180                 u32 addr, int extended, u8 *buf, u32 len)
    181 {
    182         int i, ret = 0;
    183         u16 wMax;
    184         u32 pagechunk = 0;
    185 
    186         switch (req) {
    187         case B2C2_USB_READ_V8_MEM:
    188                 wMax = USB_MEM_READ_MAX;
    189                 break;
    190         case B2C2_USB_WRITE_V8_MEM:
    191                 wMax = USB_MEM_WRITE_MAX;
    192                 break;
    193         case B2C2_USB_FLASH_BLOCK:
    194                 wMax = USB_FLASH_MAX;
    195                 break;
    196         default:
    197                 return -EINVAL;
    198         }
--> 199         for (i = 0; i < len;) {

No i++.

    200                 pagechunk =
    201                         wMax < bytes_left_to_read_on_page(addr, len) ?
    202                                 wMax :
    203                                 bytes_left_to_read_on_page(addr, len);
    204                 deb_info("%x\n",
    205                         (addr & V8_MEMORY_PAGE_MASK) |
    206                                 (V8_MEMORY_EXTENDED*extended));
    207 
    208                 ret = flexcop_usb_v8_memory_req(fc_usb, req,
    209                         page_start + (addr / V8_MEMORY_PAGE_SIZE),
    210                         (addr & V8_MEMORY_PAGE_MASK) |
    211                                 (V8_MEMORY_EXTENDED*extended),
    212                         &buf[i], pagechunk);
                                ^^^^^^^^
I think adding an i++ doesn't make sense.  Are we really writing a byte
at a time?

    213 
    214                 if (ret < 0)
    215                         return ret;
    216                 addr += pagechunk;
    217                 len -= pagechunk;
    218         }
    219         return 0;
    220 }

regards,
dan carpenter

