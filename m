Return-Path: <linux-media+bounces-54586-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NjRAj1MqWk14AAAu9opvQ
	(envelope-from <linux-media+bounces-54586-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 10:26:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039F20E5C1
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 10:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3516C304AD1E
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 09:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87F737881E;
	Thu,  5 Mar 2026 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxwJPA1O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD1831065B
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702656; cv=pass; b=LGCB/nS4vFtlGiZCJ17H6m5Xj0BWQ8zTBObtxD3OLb5O1nDBEvDEAG5SGpqIEEKsNEVp+5Z1K4uJubKFIdJVRsyUZycQhs22GvaR9ATvX4Zu8hNGhu+rBbNaL3gM2xydcbHDk8n4zjCF/lQ/ZXyaa+V7kqEsn3YkPtcbIysZ6ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702656; c=relaxed/simple;
	bh=fzjMnKx5Dmvaj+/abZHnJr4+kb8ctg0Lcon//6mFsgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXBx+iyc4aSkv623haSbh2xXkeUeoy0u0TwwB3q029lT7BO/IcujBaxQoKvWeGlzWTqIeORT0u8lfd08tHy8nEOXGZh0mU1+kd0fEQ8Ohn8wLaf+XRX8N8OsQ4vAru64XcrA3DnKApgHN4E70mgGiWJkv6/CQX6BgmL/SXV1lfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxwJPA1O; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso3334670f8f.3
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 01:24:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772702653; cv=none;
        d=google.com; s=arc-20240605;
        b=Xqa5C1s15q58vs6WauhjpEzmQ0gE2UOtED17UZU4428eolUYlNaW2HyOZm/YV72gu3
         lr4md7dLtUZhXBoq2FgCHxfbQf/C3JQMVlOcjiXXE2P7yY/S3Ub7RhbJnIiYFpU9s5i+
         swh3lx1jQm2gUjyda0CcxcsusLa5FcK0QzIZ8C2l9Fdcj0MeERwp267sYdEiMZPM9zOQ
         ZyMhCTh33scBTNT+tbeC/O4Gtj2O43rwhagWD6IubDdFm4RhsBsFyPwVKsWQykHv6MUY
         xYrBB7Xa0qVgBe8h1WbnoCQw7bdQzONs3v2l82jWb6dzixF/cAfydr6A24X+qWb1TIbR
         4WPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pVtS4eAXipKztll8obdgvYy3VuDflIV775VHJRcXCQU=;
        fh=WjUU3JYdnYv4EJulvk06sxkEv+w3IpnGKdYYii2ajeE=;
        b=eK23pfo+8Tsb+ydd55dQyh4wcox+0EJnu3CghUNCV2E3vGCplBFufSq7OWNcjfYS4u
         eoGqHXp9A6i7WIJ39Gyee98E3J6tskSSKjB3w5onm76f3u/w/H6UkFSFGmJZxBGkkIIH
         IVN/1uumxmK1k2RIPuFSCsRiNsUky+m8O6w49TiL5fsJE/Hhq6fhvBzEuQcvefgCVQwy
         qEp2apK9/0zg4rE3qDhFNKxBfLTGjTLGFsjn28/a5XSEb6mf9dHjtiYhs8g6wwI8KHMT
         /yLUbTlXhOcuiZJnXval7IVwId5bjy80dEORcrfoCvrNUCAv4cJnp7x5MZVwLVADbgy/
         oMBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772702653; x=1773307453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVtS4eAXipKztll8obdgvYy3VuDflIV775VHJRcXCQU=;
        b=XxwJPA1OgdiL/y4s+TLKMebUQQiZl+QkKkjBfPuxQlbRHUc/hJ1EX06v9FDiA341oK
         BuTs+CqvseE9KmLMKFSSr2yyzcZHfQ/rxJgI35dMeHQYAnyQ9vwNIYRIWjWcDSjMddF9
         JnZTs/WtQBA02btbzpz6Wz1OkJrO5xZ6ZLqcYhfmvlXzODQE9XcxLqQqpxM+9c1MCQzQ
         UOM5cH7izAhL+ulf6f/c9VIV/BN1um7cN1sLbi+nTEu71IQmXiPye6LFT6Pr3fTyGSAe
         Qp2LGkXPMhvjQNgYHw7Cny8Th0wYIIp6EU1ZsN/UDkj7yylwGmBiXf5DuTw87+BqsARa
         DJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702653; x=1773307453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pVtS4eAXipKztll8obdgvYy3VuDflIV775VHJRcXCQU=;
        b=NnQMs8StoSRvKK00Qn5rRc88n3WEiZFbWyUuyutHqAM/+eKwjfSp/MB7nHTaNejEsj
         FWCg7KJSwk+6qGLdfBvExX89wAv5nKvRH9qqoyU/RcIM1CyQY/DeL12PnCBLTZgeyXPG
         BCv8mfUTRaUi+Weu83gldaky6JXXD8dCW7gerlUYDLvK2xxyIgQi5r/Ez4gNkYPMLN8Y
         hAN3sg5eqxnkjvfBaGEZGnvwr3ga7CrY/Lfa2SrKpTHILJgrJZ/HBbLdqu2onihmHfqv
         u3WVCYPLMh8X6HJNaue6h2IKDftoaXBjdbEBIRLS5fCD3CdJ91v+By4TC1VKhAnUJgPw
         fs4A==
X-Forwarded-Encrypted: i=1; AJvYcCXwIMQ67q8NCIBXwiTkvmDuhFPzlJLNJR7R5iYg3GE4p5fnTg8/perk6LuSiLcZxcXWGlXQ6UX5ZqxTxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwWH+/HiHZMXMwGIGPPCdYigiT3/7aYaLRpZM1t/5no9ICRSsK
	83EkQwYn83qA4KruyyOG/eYJ+Lkh2vubEUEIoIXzt3hcomo+5M07kD4BWxFJJsCjktVaSR8Nrd3
	2K9P4YaOMBqU+coa9/SK1Nkx2hytap0o=
X-Gm-Gg: ATEYQzz2RhVQm/sGeEnxMVe12viJJLWrM1+lTvusy0Fmg4DWxBU+Io7BmR+qc/4AYEF
	lZyiidR5heCF6S9+S1oT88hGR8Cdly7WZ8IaGqp0Ybj03QsHh5MssRcmLyLEkVL+s60Cx68gq4a
	H6HwjpMlvxZuDOzOx/p6yy7H5O62QDXj/IsrsrtDNutOybuSbpkhnSxbtWF39dTHLIja0C6+/53
	gjmq9RIkVaSgFSvm1tFrdB/w+zE4mr3we5w8gH6koAhDRluaNLVAdoDQN5/5PNjQ8Krq2tUgjt8
	6Tjkssfs
X-Received: by 2002:a5d:5303:0:b0:439:cb5c:b18d with SMTP id
 ffacd0b85a97d-439cb5cb1efmr5687097f8f.38.1772702652808; Thu, 05 Mar 2026
 01:24:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303084239.15007-1-clamor95@gmail.com>
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Mar 2026 11:24:01 +0200
X-Gm-Features: AaiRm52U1-rp7kxII13ghlYufHfzAUdiofPyz6Xw8QG4vZZsa74ZdbNb3EWlC9g
Message-ID: <CAPVz0n0+FDAsRxCaPy65_N5O0KKE0tQ=zQupEM6VAR5LPLuOcg@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] tegra-video: add CSI support for Tegra20 and Tegra30
To: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8039F20E5C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54586-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

=D0=B2=D1=82, 3 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 10:42 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
>
> ---
> Changes in v2:
> - vi_sensor gated through csus
> - TEGRA30_CLK_CLK_MAX moved to clk-tegra30
> - adjusted commit titles and messages
> - clk_register_clkdev dropped from pad clock registration
> - removed tegra30-vi/vip and used tegra20 fallback
> - added separate csi schema for tegra20-csi and tegra30-csi
> - fixet number of VI channels
> - adjusted tegra_vi_out naming
> - fixed yuv_input_format to main_input_format
> - MIPI calibration refsctored for Tegra114+ and added support for
>   pre-Tegra114 to use CSI as a MIPI calibration device
> - switched ENOMEM to EBUSY
> - added check into tegra_channel_get_remote_csi_subdev
> - moved avdd-dsi-csi-supply into CSI
> - next_fs_sp_idx > next_fs_sp_value
> - removed host1x_syncpt_incr from framecounted syncpoint
> - csi subdev request moved before frame cycle
>
> Changes in v3:
> - tegra20 and tegra30 csi schema merged
> - removed unneeded properties and requirements from schema
> - improved vendor specific properties description
> - added tegra20 csus parent mux
> - improved commit descriptions
> - redesigned MIPI-calibration to expose less SoC related data into header
> - commit "staging: media: tegra-video: csi: add support for SoCs with int=
egrated
>   MIPI calibration" dropped as unneeded
> - improved tegra_channel_get_remote_device_subdev logic
> - avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
> - software syncpoint counters switched to direct reading
> - adjusted planar formats offset calculation
>
> Changes in v4:
> - removed ifdefs from tegra_mipi_driver
> - document Tegra132 MIPI calibration device
> - switched to use BIT macro in tegra114-mipi
> - pinctrl changes moved to a separate patch
> - ERESTARTSYS workaround preserved for now
> - tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
> - reworked bytesperline and sizeimage calculaion
>
> Changes in v5:
> - dropped patch 1/24 of v4 since it was picked to pinctrl tree
> - added reasoning for tegra132 comaptible into commit desctiption
> - moved clocks into common section in tegra20-csi schema
> - added note regarding ERESTARTSYS
>
> Changes in v6:
> - dropped patches 1, 2, 3, 4, 10, 13, 21, 22 of v5 since they were picked
> - rebased on top of linux next/master
> - improved description of commit
>   "staging: media: tegra-video: vi: adjust get_selection operation check"
>
> Changes in v7:
> - rebased on top of v7
> - kzalloc > kzalloc_obj in mipi.c
> ---
>
> Svyatoslav Ryhel (15):
>   staging: media: tegra-video: expand VI and VIP support to Tegra30
>   staging: media: tegra-video: vi: adjust get_selection operation check
>   staging: media: tegra-video: vi: add flip controls only if no source
>     controls are provided
>   staging: media: tegra-video: csi: move CSI helpers to header
>   gpu: host1x: convert MIPI to use operation function pointers
>   staging: media: tegra-video: vi: improve logic of source requesting
>   staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
>     CSI
>   staging: media: tegra-video: tegra20: set correct maximum width and
>     height
>   staging: media: tegra-video: tegra20: add support for second output of
>     VI
>   staging: media: tegra-video: tegra20: adjust format align calculations
>   staging: media: tegra-video: tegra20: set VI HW revision
>   staging: media: tegra-video: tegra20: increase maximum VI clock
>     frequency
>   staging: media: tegra-video: tegra20: expand format support with
>     RAW8/10 and YUV422/YUV420p 1X16
>   staging: media: tegra-video: tegra20: adjust luma buffer stride
>   staging: media: tegra-video: add CSI support for Tegra20 and Tegra30
>
>  drivers/gpu/drm/tegra/dsi.c                 |   1 +
>  drivers/gpu/host1x/Makefile                 |   1 +
>  drivers/gpu/host1x/mipi.c                   | 592 +++-----------
>  drivers/gpu/host1x/tegra114-mipi.c          | 483 ++++++++++++
>  drivers/staging/media/tegra-video/Makefile  |   1 +
>  drivers/staging/media/tegra-video/csi.c     |  64 +-
>  drivers/staging/media/tegra-video/csi.h     |  22 +
>  drivers/staging/media/tegra-video/tegra20.c | 820 +++++++++++++++++---
>  drivers/staging/media/tegra-video/vi.c      |  58 +-
>  drivers/staging/media/tegra-video/vi.h      |   6 +-
>  drivers/staging/media/tegra-video/video.c   |   8 +-
>  drivers/staging/media/tegra-video/vip.c     |   2 +-
>  drivers/staging/media/tegra-video/vip.h     |   2 +-
>  include/linux/host1x.h                      |  10 -
>  include/linux/tegra-mipi-cal.h              |  57 ++
>  15 files changed, 1482 insertions(+), 645 deletions(-)
>  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
>  create mode 100644 include/linux/tegra-mipi-cal.h
>

Hello there!

May this patchset be picked if everyone is fine with it? v6 iteration
was hanging for a quite some time already without any actions, I have
rebased v7 onto linux-next but no other major changes were applied.

Best regards,
Svyatoslav R.

> --
> 2.51.0
>

