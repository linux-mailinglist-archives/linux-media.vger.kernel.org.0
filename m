Return-Path: <linux-media+bounces-56030-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHbGB8AouWkAtAEAu9opvQ
	(envelope-from <linux-media+bounces-56030-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:11:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 290652A79C6
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4982300C34C
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FA63A4F44;
	Tue, 17 Mar 2026 10:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="z/nZBfK8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8CE84039;
	Tue, 17 Mar 2026 10:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741909; cv=none; b=L6YHPruYzoyKt+3e75JHUsuJuCsm5i5ZpnQHD/S7nPB0T9x3mGoTEMmHUiwmPgTbU8E8iqUnxzi6qsOqlY32qEO3ane7akLNxsaZwSnUUGxqeGQ6jPLDa92/iJG11TLeb/0ao07d7RwIwG69rvS6oGIZrBo85fPtOTxZlmFLTB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741909; c=relaxed/simple;
	bh=1g3CqT8gCy510UUUsAdMzKQU3risfXYiRno+HhmRkto=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=c28YTeTHhIxab8n7owvghP9UjbzlOU5wo+P1kGqNU88WqSWZSrHawam+GMvbn8offEvIsrDF2FyoUGiNnRzwUGGxONhkSKpQoJ9Z9d0/S+vJsTX40dCr09+KN9/P6Gsz8Iu+cebDTM3HnneAqvss1zTpQAQLWv917q3HrueXCLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=z/nZBfK8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 316761A2E84;
	Tue, 17 Mar 2026 10:05:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0CC05FC9A;
	Tue, 17 Mar 2026 10:05:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7C1810450405;
	Tue, 17 Mar 2026 11:04:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773741903; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I1PUYYA+kCa3SQEPsUk+ui1wHEWokk2KMQCSQD3wjGc=;
	b=z/nZBfK83C/z42Gy7D0i6aCgKJ3OvXcM6D7Zhe7QznTeulVjo01/rnrOfNUHaPEc+6vty2
	i6H961xgefwV0ipYpEgTYCCWXHsa4ErIBBkuXj3y1k9rFx5cjNL7AcAmuLbZJZbBf3FbHJ
	qLny+W0GmgTrADZK/PNDo0pni1R+6qzPJ+UAmEdwcWuPL7WVztce0W8hH7fHeVFaweaz63
	9mZgFvhgmLbyypiXioo4ae+ad92irsZpQ42Dg9hXwqtAD7MokPDl8reQxvAIzk00yo/Clx
	Ox6ye6p+ufsTjRsr+ffPw8ERfWxrSaepczzFNUH6K3oGCwDIoUjzZqr19yPWTg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 11:04:58 +0100
Message-Id: <DH4Z0YY7GPKV.3EKN4U52NE63@bootlin.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-staging@lists.linux.dev>
To: "Svyatoslav Ryhel" <clamor95@gmail.com>, "Thierry Reding"
 <thierry.reding@gmail.com>, "Thierry Reding" <treding@nvidia.com>, "Mikko
 Perttunen" <mperttunen@nvidia.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Sowjanya Komatineni" <skomatineni@nvidia.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Hans Verkuil" <hverkuil+cisco@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 00/15] tegra-video: add CSI support for Tegra20 and
 Tegra30
X-Mailer: aerc 0.20.1
References: <20260303084239.15007-1-clamor95@gmail.com>
 <CAPVz0n0+FDAsRxCaPy65_N5O0KKE0tQ=zQupEM6VAR5LPLuOcg@mail.gmail.com>
In-Reply-To: <CAPVz0n0+FDAsRxCaPy65_N5O0KKE0tQ=zQupEM6VAR5LPLuOcg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56030-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,kernel.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,bootlin.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 290652A79C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 5, 2026 at 10:24 AM CET, Svyatoslav Ryhel wrote:
> =D0=B2=D1=82, 3 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 10:42 Svy=
atoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>>
>> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
>> with a set of changes required for that.
>>
>> ---
>> Changes in v2:
>> - vi_sensor gated through csus
>> - TEGRA30_CLK_CLK_MAX moved to clk-tegra30
>> - adjusted commit titles and messages
>> - clk_register_clkdev dropped from pad clock registration
>> - removed tegra30-vi/vip and used tegra20 fallback
>> - added separate csi schema for tegra20-csi and tegra30-csi
>> - fixet number of VI channels
>> - adjusted tegra_vi_out naming
>> - fixed yuv_input_format to main_input_format
>> - MIPI calibration refsctored for Tegra114+ and added support for
>>   pre-Tegra114 to use CSI as a MIPI calibration device
>> - switched ENOMEM to EBUSY
>> - added check into tegra_channel_get_remote_csi_subdev
>> - moved avdd-dsi-csi-supply into CSI
>> - next_fs_sp_idx > next_fs_sp_value
>> - removed host1x_syncpt_incr from framecounted syncpoint
>> - csi subdev request moved before frame cycle
>>
>> Changes in v3:
>> - tegra20 and tegra30 csi schema merged
>> - removed unneeded properties and requirements from schema
>> - improved vendor specific properties description
>> - added tegra20 csus parent mux
>> - improved commit descriptions
>> - redesigned MIPI-calibration to expose less SoC related data into heade=
r
>> - commit "staging: media: tegra-video: csi: add support for SoCs with in=
tegrated
>>   MIPI calibration" dropped as unneeded
>> - improved tegra_channel_get_remote_device_subdev logic
>> - avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
>> - software syncpoint counters switched to direct reading
>> - adjusted planar formats offset calculation
>>
>> Changes in v4:
>> - removed ifdefs from tegra_mipi_driver
>> - document Tegra132 MIPI calibration device
>> - switched to use BIT macro in tegra114-mipi
>> - pinctrl changes moved to a separate patch
>> - ERESTARTSYS workaround preserved for now
>> - tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
>> - reworked bytesperline and sizeimage calculaion
>>
>> Changes in v5:
>> - dropped patch 1/24 of v4 since it was picked to pinctrl tree
>> - added reasoning for tegra132 comaptible into commit desctiption
>> - moved clocks into common section in tegra20-csi schema
>> - added note regarding ERESTARTSYS
>>
>> Changes in v6:
>> - dropped patches 1, 2, 3, 4, 10, 13, 21, 22 of v5 since they were picke=
d
>> - rebased on top of linux next/master
>> - improved description of commit
>>   "staging: media: tegra-video: vi: adjust get_selection operation check=
"
>>
>> Changes in v7:
>> - rebased on top of v7
>> - kzalloc > kzalloc_obj in mipi.c
>> ---
>>
>> Svyatoslav Ryhel (15):
>>   staging: media: tegra-video: expand VI and VIP support to Tegra30
>>   staging: media: tegra-video: vi: adjust get_selection operation check
>>   staging: media: tegra-video: vi: add flip controls only if no source
>>     controls are provided
>>   staging: media: tegra-video: csi: move CSI helpers to header
>>   gpu: host1x: convert MIPI to use operation function pointers
>>   staging: media: tegra-video: vi: improve logic of source requesting
>>   staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
>>     CSI
>>   staging: media: tegra-video: tegra20: set correct maximum width and
>>     height
>>   staging: media: tegra-video: tegra20: add support for second output of
>>     VI
>>   staging: media: tegra-video: tegra20: adjust format align calculations
>>   staging: media: tegra-video: tegra20: set VI HW revision
>>   staging: media: tegra-video: tegra20: increase maximum VI clock
>>     frequency
>>   staging: media: tegra-video: tegra20: expand format support with
>>     RAW8/10 and YUV422/YUV420p 1X16
>>   staging: media: tegra-video: tegra20: adjust luma buffer stride
>>   staging: media: tegra-video: add CSI support for Tegra20 and Tegra30
>>
>>  drivers/gpu/drm/tegra/dsi.c                 |   1 +
>>  drivers/gpu/host1x/Makefile                 |   1 +
>>  drivers/gpu/host1x/mipi.c                   | 592 +++-----------
>>  drivers/gpu/host1x/tegra114-mipi.c          | 483 ++++++++++++
>>  drivers/staging/media/tegra-video/Makefile  |   1 +
>>  drivers/staging/media/tegra-video/csi.c     |  64 +-
>>  drivers/staging/media/tegra-video/csi.h     |  22 +
>>  drivers/staging/media/tegra-video/tegra20.c | 820 +++++++++++++++++---
>>  drivers/staging/media/tegra-video/vi.c      |  58 +-
>>  drivers/staging/media/tegra-video/vi.h      |   6 +-
>>  drivers/staging/media/tegra-video/video.c   |   8 +-
>>  drivers/staging/media/tegra-video/vip.c     |   2 +-
>>  drivers/staging/media/tegra-video/vip.h     |   2 +-
>>  include/linux/host1x.h                      |  10 -
>>  include/linux/tegra-mipi-cal.h              |  57 ++
>>  15 files changed, 1482 insertions(+), 645 deletions(-)
>>  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
>>  create mode 100644 include/linux/tegra-mipi-cal.h
>>
>
> Hello there!
>
> May this patchset be picked if everyone is fine with it? v6 iteration
> was hanging for a quite some time already without any actions, I have
> rebased v7 onto linux-next but no other major changes were applied.

FWIW I just tested this on v7.0-rc4 and tegra20 parallel capture still
works as before, so my Tested-by is confirmed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

