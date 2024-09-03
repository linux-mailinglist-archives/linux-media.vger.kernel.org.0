Return-Path: <linux-media+bounces-17468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF578969C3C
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 13:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B0CFB24431
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 11:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BB81A42DB;
	Tue,  3 Sep 2024 11:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aa6WaNot"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559B1B12C8
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725363859; cv=none; b=jGWu0dB/HJ79+Q5/bEXiUpzdedVHLxZEUGIUywMJJDxa2E2f1jlxSag2vwV4IabqwvKrK4tomn2zuGOk/S3vwTRQWuNukQ37G4DQ5u5AN696NJ00SiZ4mdTVMCkgzDCoRdawGZKWXbKKe8qnxNYOgzNnWZwgx5FaTnJpAgcCoEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725363859; c=relaxed/simple;
	bh=jIXh5tlmZcM7tDulwkDMRWPSPizsCZj5tEK9s6m8D4Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=jlUfulnTrnIYheDPWexA06b7pk8yRT1ekm5Y8S7TEaLdXeyCfDekEbU7ZL3I8gGqwWsnZjSKIYldcR1+TAVIhMKDMoCH+IasgjooJldaPplLczLYvXP6F0JpMxAiJpOepHwHtK2ZXUkRLg6VaRN278RrGB4ee/wVqLM7tSy0+7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aa6WaNot; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725363856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kaGFpI7gezxp6eB3ynNhZmfJ/RHMa50iGqzNXytWW8Y=;
	b=aa6WaNotGle6hvFgjDEGt0ItQll2VmvjZYHCW6suvUpvKZGZbB4u9oClNQv4sK2cyj9SNG
	sxGUFRmPhB2wf/WoJgN6K2QIx1yb+odRuq3sTtHgeNuX2007XARJbCHhtcQzLnhrDKLPx2
	FEUJGBFAtRyaEg0B+bBfaecCqzk/7ic=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-hn6mYnAYNt2lQCxwBveZDg-1; Tue, 03 Sep 2024 07:44:15 -0400
X-MC-Unique: hn6mYnAYNt2lQCxwBveZDg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a869b31d816so390844466b.0
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2024 04:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725363854; x=1725968654;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kaGFpI7gezxp6eB3ynNhZmfJ/RHMa50iGqzNXytWW8Y=;
        b=sqBZW3+XImddGsk1F94ayNx12w9rYKqFuFbK2jX3e25IPD7iqYHDiXQN1XIjWTLl8Y
         ZWDBuQxpjWUPe9y/UCbYZkkKfhNZcXIEZa/JVji0ZwbgDNKLIvt8LaCRuZr05YsbV2VM
         1GESCqw6/+vMOaV+9riVWg6/shqrjojgbxWVP5FllPfOYJAtM5EPJMumtMuUvrxVu/Kk
         4hj3SdeslP8WOgPQ7e/0vlV9j7SsP/GfnrTunHJzfOoI9hiNflcJAjxE8oorm+9LEdg/
         wk4UWWclOCG5w85DQIcJBTn2IhcPQ6jbKEcOrxYf85g1WTbw29p4Sq03z7N8kmrrwGul
         g8PA==
X-Forwarded-Encrypted: i=1; AJvYcCUSf/bSwhJ62nbI73tCUl4Q/juS1CrMYET1VJdeEFVEDStVivWV1vbUVnIawGxYHB5PqnXkSsmnIQIt1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXZeSrRUI+x9d8qeDMCkZawxE1/F/2Q9Ht8qssugAYkmjQrxsN
	ygXMdyZESsLXtJb1YiPhYN9Ay24/HrVh9AEkWY9fD2PpAJMkzhmy8q+lXNnA0Uv3bx0a3VXaHpI
	jYCE9BXU00duE2QzeXrq08illwnUaxHjAeBUJ/SdmpNpxmbgWVnpLbc0dqBcIQZydY8sh
X-Received: by 2002:a17:907:3e94:b0:a86:8a05:760d with SMTP id a640c23a62f3a-a8a1d29ba0dmr232920366b.5.1725363853838;
        Tue, 03 Sep 2024 04:44:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv0O3OzV/lIyhzpkP7TzMpbLJl2Zrrt2YBl2nSg8IMvao/WlCpv3rZPlmgzJnWsOnBmcOcDQ==
X-Received: by 2002:a17:907:3e94:b0:a86:8a05:760d with SMTP id a640c23a62f3a-a8a1d29ba0dmr232918166b.5.1725363853287;
        Tue, 03 Sep 2024 04:44:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900f055sm668600566b.67.2024.09.03.04.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 04:44:12 -0700 (PDT)
Message-ID: <44e7e455-754b-4b2e-9b06-11562e3ad3ec@redhat.com>
Date: Tue, 3 Sep 2024 13:44:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.12-1
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro, Hans,

Here are the atomisp changes for 6.12.

Highlights:
- Bunch of janitorial fixes
- 2 vb2 handling fixes from Hans Verkuil
- DMI quirk for t4ka3 on Xiaomi Mipad2
- Some debug logging improvements

Regards,

Hans



The following changes since commit 3f52e32445a1f63b788bc8969b7dc2386a80a24d:

  media: MAINTAINERS: Add "qcom," substring for Qualcomm Camera Subsystem (2024-08-31 09:40:44 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.12-1

for you to fetch changes up to dc5f73671c1021d44a6fb138af738490cd815791:

  media: atomisp: set lock before calling vb2_queue_init() (2024-09-03 11:39:58 +0200)

----------------------------------------------------------------
atomisp staging driver changes for 6.12-1

Highlights:
- Bunch of janetorial fixes
- 2 vb2 handling fixes from Hans Verkuil
- DMI quirk for t4ka3 on Xiaomi Mipad2
- Some debug logging improvements

----------------------------------------------------------------
Andy Shevchenko (3):
      media: atomisp: Remove duplicated leftover, i.e. sh_css_dvs_info.h
      media: atomisp: Replace rarely used macro from math_support.h
      media: atomisp: Simplify ia_css_pipe_create_cas_scaler_desc_single_output()

Christophe JAILLET (1):
      media: atomisp: Use clamp() in ia_css_eed1_8_vmem_encode()

Hans Verkuil (2):
      media: atomisp: add missing wait_prepare/finish ops
      media: atomisp: set lock before calling vb2_queue_init()

Hans de Goede (3):
      media: atomisp: csi2-bridge: Add DMI quirk for t4ka3 on Xiaomi Mipad2
      media: atomisp: Drop dev_dbg() calls from hmm_[alloc|free]()
      media: atomisp: Improve binary finding debug logging

Kartik Kulkarni (1):
      media: atomisp: bnr: fix trailing statement

Kathara Sasikumar (1):
      media: atomisp: Fix trailing statement in ia_css_de.host.c

Li Zetao (2):
      media: atomisp: use clamp() in ia_css_eed1_8_encode()
      media: atomisp: use clamp() in compute_coring()

Roshan Khatri (3):
      media: atomisp: Fix spelling mistake in csi_rx_public.h
      media: atomisp: Fix spelling mistakes in atomisp_platform.h
      media: atomisp: Fix spelling mistakes in atomisp.h

Sakirnth Nagarasa (1):
      media: atomisp: move trailing statement to next line.

Sergio de Almeida Cipriano Junior (1):
      media: atomisp: move trailing */ to separate lines

Zhang Zekun (1):
      media: atomisp: Remove unused declaration

 .../staging/media/atomisp/include/linux/atomisp.h  |   4 +-
 .../media/atomisp/include/linux/atomisp_platform.h |   6 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c        |   2 +
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |   2 +
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |   2 +-
 .../pci/hive_isp_css_include/assert_support.h      |   6 +-
 .../pci/hive_isp_css_include/host/csi_rx_public.h  |   4 +-
 .../pci/hive_isp_css_include/math_support.h        |   6 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |   5 -
 .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c  |   3 +-
 .../pci/isp/kernels/de/de_1.0/ia_css_de.host.c     |   3 +-
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c    |  22 +-
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c  |   3 +-
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c  |   9 +-
 .../yuv444_io_ls/ia_css_yuv444_io.host.c           |   9 +-
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c |  12 +-
 .../media/atomisp/pci/runtime/binary/src/binary.c  | 259 ++++++++-------------
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    |   8 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |  44 ++--
 .../staging/media/atomisp/pci/sh_css_dvs_info.h    |  37 ---
 .../staging/media/atomisp/pci/sh_css_param_dvs.h   |   1 -
 21 files changed, 167 insertions(+), 280 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_dvs_info.h


