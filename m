Return-Path: <linux-media+bounces-55433-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNDfBZGusWmzEQAAu9opvQ
	(envelope-from <linux-media+bounces-55433-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 19:04:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B162626863D
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 19:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC1823076714
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 18:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53EF3E6DCF;
	Wed, 11 Mar 2026 18:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kk4LgZZI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69293276058;
	Wed, 11 Mar 2026 18:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773252232; cv=none; b=MQ1VBzBOJuY/ssSSIeK894foOyeJpadhKyTVJ9ab/JP5fY7ZaoRuvOKL97jLHg5U//00VbWJ0M7aegPe5b7vczDM5opS2yMTOPk0tWongCTuF2Xb/6wd1BvO1LE6Id8ALaAPpTSlJVAEeo+pTLIww7P5i09pZqmLWtcBfyEYQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773252232; c=relaxed/simple;
	bh=nWjgFboX5ptDv9cwsxiLZL/pj6ZqRh+N68BoTYtnc6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8XQ+b5yEyBBf/SWlpV+YXN6NG7QUDT+1Doq3N7u78/Ohp9VC3VbZScvhYeZENlDUdWk4rMXnfWuywYJU0AtzY2dW1CWOhiOZph075BHLwZZmRLNA/4PoS+1CxMKRMwtdjr00Ywa7tHCj1wMigklGTgjITdxUaWQqVzgswAW7Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kk4LgZZI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 122D94B3;
	Wed, 11 Mar 2026 19:02:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773252160;
	bh=nWjgFboX5ptDv9cwsxiLZL/pj6ZqRh+N68BoTYtnc6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kk4LgZZIoSxeatcGRoJRgsqR1flfJSaFTfg03o0J27GwT4wXj+EXw+tLvE20yozr+
	 x7w+zf1jF9HF3ICxMTUCOhjKt9l8pvGvd1EAUs9h3xLjZBry7uNwlSppLvfQAAgx9K
	 GxAauLunb+FSnKcGDXRaLMCHvwy31meaK5DxtTOY=
Message-ID: <955b056b-66d6-4215-9671-233844f57464@ideasonboard.com>
Date: Wed, 11 Mar 2026 20:03:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] media: rcar: Streams support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311173828.GC1156208@ragnatech.se>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260311173828.GC1156208@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55433-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: B162626863D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 11/03/2026 19:38, Niklas Söderlund wrote:
> Hi Tomi,
> 
> Thanks for your work.
> 
> On 2026-03-11 15:53:13 +0200, Tomi Valkeinen wrote:
>> Add streams support to Renesas rcar platform driver.
>>
>> The series keaps compatibility with the current upstream for a single
>> stream use case. However, in upstream there's a limited custom
>> multi-stream support implemented to the rcar driver, which will be
>> replaced with the upstream's Streams API.
>>
>> I have tested this series on Sparrow-Hawk board, with a few different
>> setups:
>>
>> IMX219 connected to the CSI0 connector
>> - The following patches applied to my test branch in addition to this
>>   series:
>>   1) The v4l2_subdev_get_frame_desc_passthrough dependency
>>   2) Revert of commit e7376745ad5c8548e31d9ea58adfb5a847e017a4 ("media:
>>      rcar-vin: Fix stride setting for RAW8 formats"), as that commit
>>      breaks RAW8
> 
> Is this still needed, was this not fixed by "[PATCH] media: renesas: 
> vin: Fix RAW8 (again)" ?

Indeed, not needed, the "Fix RAW8 (again)" solves it.

 Tomi

> 
>> - Tested with a single video stream
>>
>> IMX219 connected to the CSI0 connector
>> - Plenty of other patches applied to enable full streams support and
>>   embedded data support in imx219 and v4l2 framework
>> - Tested with video and embedded data streams
>>  
>> Arducam FPD-Link board + 4 x IMX219 connected to the CSI0 connector
>> - Plenty of other patches applied to enable full streams support and
>>   embedded data support in imx219 and v4l2 framework, and TPG support in
>>   ub953
>> - Tested with video and embedded data streams from all four cameras (so
>>   8 streams in total)
>> - Also tested with ub953's TPG, combined with video & embedded streams
>>   from other cameras.
>>
>> I have observed one issue with the embedded data (i.e. requiring bunch
>> of patches not in upstream): when stopping streaming, VIN says that it
>> cannot stop the stream. I haven't debugged that, but a possible issue is
>> that the if the video stream for the imx219 is stopped first, the
>> embedded data stops also, and VIN does not get the frame-end it is
>> waiting for.
>>
>>  Tomi
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>> Changes in v5:
>> - Rebase on v7.0-rc2, with the streams preparation series and
>>   get_frame_desc_passthrough series as dependencies
>> - This series is now smaller, as the non-streams parts are in the
>>   streams preparation series
>> - Fix "variable ‘format’ set but not used" warning
>> - Link to v4: https://lore.kernel.org/r/20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com
>>
>> Changes in v4:
>> - Rebased on v6.18, with minor conflicts resolved
>> - Improved patch descriptions
>> - Re-ordered the patches a bit to move changes that could be applied
>>   without the full streams support to the beginning of the series
>> - Added "media: rcar-vin: Link VINs on Gen3 to a single channel on each
>>   CSI-2" which removes possibility of wrong routing config on Gen3
>> - Added "media: rcar-csi2: Improve FLD_FLD_EN macros" which was part of
>>   another patch in v3
>> - Addressed minor comments (constifyings, cosmetics)
>> - Fixed the missing stream_count checks in disable_streams ops
>> - Fixed a few instances in csisp and csi2 where
>>   v4l2_subdev_state_get_format() was called with hardcoded pad/stream,
>>   instead of using the data from the route
>> - Dropped unnecessary ISPPROCMODE_DT_REG register clears
>> - Squashed "media: rcar-csi2: Add more stream support to
>>   rcsi2_calc_mbps()" into a previous patch
>> - Dropped wrong use_isp check from csi2's rcsi2_set_routing()
>> - Link to v3: https://lore.kernel.org/r/20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com
>>
>> Changes in v3:
>> - Rebased on top of latest linux-media
>> - Dropped dependencies which are already in linux-media (only remaining
>>   dependency is v4l2_subdev_get_frame_desc_passthrough)
>> - Tested on white-hawk board, using the staging deser TPG
>> - Also tested in a WIP branch for GMSL2 (two video streams)
>> - Link to v2: https://lore.kernel.org/r/20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com
>>
>> Changes in v2:
>> - Rebased on top of latest upstream, and updated the dependencies to
>>   match the latest serieses sent.
>> - Add new patch "media: rcar-csi2: Use the pad version of v4l2_get_link_freq()"
>> - Drop "media: rcar-csi2: Fix typo" (it was not a typo)
>> - Update the code in calc_mbps(). The previous method relied on
>>   V4L2_CID_LINK_FREQ, but that's not available if the link-freq is
>>   provided via get_mbus_config().
>> - Dropped dependencies to Niklas' old series which doesn't apply
>>   cleanly. It's needed for multi-stream, but not for the current
>>   upstream which only has a single stream use case.
>> - Link to v1: https://lore.kernel.org/r/20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com
>>
>> ---
>> Tomi Valkeinen (10):
>>       media: rcar-vin: Link VINs on Gen3 to a single channel on each CSI-2
>>       media: rcar-isp: Move {enable|disable}_streams() calls
>>       media: rcar-csi2: Move {enable|disable}_streams() calls
>>       media: rcar-csi2: Switch to Streams API
>>       media: rcar-isp: Switch to Streams API
>>       media: rcar-csi2: Add .get_frame_desc op
>>       media: rcar-isp: Call get_frame_desc to find out VC & DT
>>       media: rcar-csi2: Call get_frame_desc to find out VC & DT (Gen3)
>>       media: rcar-csi2: Add full streams support
>>       media: rcar-isp: Add full streams support
>>
>>  drivers/media/platform/renesas/rcar-csi2.c         | 323 ++++++++++++++++-----
>>  drivers/media/platform/renesas/rcar-isp/csisp.c    | 227 ++++++++++++---
>>  .../media/platform/renesas/rcar-vin/rcar-core.c    |  27 +-
>>  3 files changed, 445 insertions(+), 132 deletions(-)
>> ---
>> base-commit: 9fad1d148df6f36105159c2503d0ecb1397bc89a
>> change-id: 20250219-rcar-streams-1fdea8860e5e
>> prerequisite-change-id: 20260115-rcar-streams-prep-1-1cc285538848:v1
>> prerequisite-patch-id: 78155acff7a40c74881accca6d9699476405e937
>> prerequisite-patch-id: 983b909c5d3667711baf2112713eac7862e5f9e7
>> prerequisite-patch-id: 6dba98cf21fb95029009733448075ee0380eaf16
>> prerequisite-patch-id: db9ed82262cd02a2cb6941dc30f731b6b7c4410c
>> prerequisite-patch-id: 2342bc950678d13b5aa41b2faa276ad1c0e3d850
>> prerequisite-change-id: 20250218-frame-desc-passthrough-66805e413974:v5
>> prerequisite-patch-id: 4b1733536cdc5b2bdd3c996032273c576228da72
>> prerequisite-patch-id: 69b75e7dad9ced905cb39a72f18bebbf3e8f998a
>> prerequisite-patch-id: 58463f6944c76acd6cf203b14a2836cdb0db2461
>>
>> Best regards,
>> -- 
>> Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
> 


