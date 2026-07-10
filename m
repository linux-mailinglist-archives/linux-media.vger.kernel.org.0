Return-Path: <linux-media+bounces-67248-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iDyELmG2UGpx3wIAu9opvQ
	(envelope-from <linux-media+bounces-67248-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:07:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39778738D61
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:07:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67248-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67248-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91755306BBE4
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2078B396588;
	Fri, 10 Jul 2026 08:58:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127B23C9896
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 08:58:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673887; cv=none; b=bPpPuc3iUNmJtBu4edvD6Fp8RbNaiNlv3dasnVf4+prf1aWIM5dFrggGrpzrp5u0K9Jg7JILjs/x9NFgRiHFrypxTw/CEPH/MaRhrgB0+IV340yS1lkUI8EDrzwW7+kn14bXB37EAbDVhLd3e0bLQe/cvngB1TI/R3gq0XSj9xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673887; c=relaxed/simple;
	bh=L2pl+s1nG4JtEDjGR7ss4RjDd6y+PSYp9694X1GNbBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXloAghp/m7EGb5lc+TY2bmqLxG+KRfz/Hv9uv1MgV2gUIbm/X/Xa3+IurAMJqm5cb9DV+bnSw4+25ekPucnhLeipfYZdArRrd//3hTICxFQqGD0doasfpaycjces0xAtwNxPp5ig5uJ4Ho0oPNmpmvz2CpSinVE29pBi4wik5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wi73H-0004DF-DQ; Fri, 10 Jul 2026 10:57:43 +0200
Message-ID: <d4ee7cc1-fd04-480b-8543-46ca5c746107@pengutronix.de>
Date: Fri, 10 Jul 2026 10:57:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] media: v4l2-common: Add kernel-doc for
 v4l2_fill_pixfmt_mp_aligned()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-4-tommaso.merciai.xr@bp.renesas.com>
 <ak9r850ftuu830At@zed>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <ak9r850ftuu830At@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:tommaso.merciai.xr@bp.renesas.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:m.szyprowski@samsung.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-67248-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,kernel.org,collabora.com,linux.intel.com,ideasonboard.com,samsung.com,crapouillou.net];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,pengutronix.de:mid,pengutronix.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39778738D61

Hi Jacopo,

On 7/9/26 11:51 AM, Jacopo Mondi wrote:
> Hi Tommaso
>
> On Wed, Jul 08, 2026 at 06:14:04PM +0200, Tommaso Merciai wrote:
>> Replace the bare placeholder comment with a full kernel-doc block
>> documenting all parameters, the function behaviour for both single
>> memory plane (mem_planes == 1) and multiple memory plane (mem_planes > 1)
>> formats, and the return value.
>>
>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>> ---
>> v2->v3:
>>   - Moved to PATCH 3/4
>>   - Fixed documentation as suggested by Sven Püschel
>>
>> v1->v2:
>>   - New patch
>>
>>   include/media/v4l2-common.h | 28 +++++++++++++++++++++++++++-
>>   1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
>> index be4dd9762196..f2b0c336ac81 100644
>> --- a/include/media/v4l2-common.h
>> +++ b/include/media/v4l2-common.h
>> @@ -591,7 +591,33 @@ static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
>>   	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
>>   }
>>
>> -/* @stride_alignment is a power of 2 value in bytes */
>> +/**
>> + * v4l2_fill_pixfmt_mp_aligned - Fill in a &struct v4l2_pix_format_mplane with
>> + *	stride alignment requirements.
>> + *
>> + * @pixfmt: pointer to the &struct v4l2_pix_format_mplane to be filled
>> + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
>> + * @width: image width in pixels
>> + * @height: image height in pixels
>> + * @stride_alignment: stride alignment in bytes; must be a power of 2
>> + *
>> + * Fills all fields of @pixfmt for the given pixel format, dimensions, and
>> + * stride alignment.
>> + *
>> + * For formats stored in a single memory plane (mem_planes == 1), the
>> + * behaviour matches v4l2_fill_pixfmt_aligned(): plane_fmt[0].bytesperline
>> + * is set to the primary plane stride. The strides of all components are
>> + * aligned to the @stride_alignment. To keep the chroma strides consistently
>> + * derivable from the luma stride, strides may be aligned to a multiple of
>> + * the @stride_alignment instead. plane_fmt[0].sizeimage covers all
>
> I guess this
>
> "To keep the chroma strides consistently derivable from the luma
> stride, strides may be aligned to a multiple of the @stride_alignment
> instead."
>
> comes from teh v4l2_format_plane_stride() implementation.
>
> I admit is not 100% clear to me why the chroma strides is multiplied
> and to which format this applies. But this is not on this patch...

When not using multi-planar formats, we only have the stride value for 
the Y component and the other stride values are derived from it. This is 
the cause of this whole scaling.

E.g. for YUV420 4x2px picture, we have 4 bytes stride in the y plane and 
2 byte in the cb and cr plane. If we align the stride to 4 bytes (in all 
planes), we want both values to be a multiple of 4. As the cb/cr stride 
is derived from the y stride, we have to set the y stride to 8 bytes to 
get the desired 4 bytes stride in the cb/cr planes.

The rare case for scaling the component stride is NV24/42 (at least this 
is the only one I currently know of), where we actually have 4:4:4 
sub-sampling and have the cb/cr parts interleaved. So for a 1x2px 
picture we have 1 bytes in the y plane and 2 bytes in the c plane. To 
align to 4 bytes we need to set the c plane stride to 8 to be able to 
set the y plane stride to 4.


For multi-planar formats we have a separate stride for each component, 
so we just align all component strides to the given alignment.


Sincerely
     Sven


