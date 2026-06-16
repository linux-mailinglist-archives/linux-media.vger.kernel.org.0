Return-Path: <linux-media+bounces-65019-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0h3VJRtMMWr2gAUAu9opvQ
	(envelope-from <linux-media+bounces-65019-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:14:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F190868FCB1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:14:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=WSNr588A;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65019-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65019-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC34730D20D9
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CA737701A;
	Tue, 16 Jun 2026 13:12:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BD03749F4;
	Tue, 16 Jun 2026 13:12:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615558; cv=none; b=mmRuBq/C3ZdJjRZAUcNnHEzo/MXtdA6C+hHANRUPZJF3KrtEeW8doMtCVA8KsnOgM2AdmN01/aZBkoLMCUV8TYg/Mg6Jf+3aWcqgIy2iTJ+zjUTelUWUPpU78zCkhjbTW41ExsW4rA6Mb64T004F9fmrXhevrjgSZLvk5AujUaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615558; c=relaxed/simple;
	bh=HMLQjYYkd8pzDuxjOWgfJ/IjPMHeFnEpA6wxlZQRU48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lev1WhTHSQeqWSuXyQ6iTo03H3QDMVQ13rHV4BkMWCan//kTm76s39teZA4ULkW2b4qxx1WlMB7ANjLKhkH7+GVO4fJiOOTEmcT9C41j/jk8VZJlSK2F7I0GexFfC14dEHbxVt65KBEEpT5p4qphVC20LSJMYYj74Up7vwUpFEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WSNr588A; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E00F48FA;
	Tue, 16 Jun 2026 15:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781615521;
	bh=HMLQjYYkd8pzDuxjOWgfJ/IjPMHeFnEpA6wxlZQRU48=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WSNr588A4j2/cDYolgrSyuIzMK3VMKmCVaK7SdIaDUGCsXccnhahWlQ+HB88Ux4ve
	 eV1t1sMiCRk1Dogxl4bk/9wLZPezx59nmhmVwPWsj/ylomq7KmL3JG+Ch6eL+Fg639
	 UdQv1eLPTTYga4qR8cOPZiScl2KyqIuE94oKEVyI=
Message-ID: <eb5c1b62-d468-40e1-9d9b-18f83febf195@ideasonboard.com>
Date: Tue, 16 Jun 2026 16:12:31 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] media: rcar-csi2: Add .get_frame_desc op
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-6-3e6c957d7567@ideasonboard.com>
 <20260318211654.GJ716464@killaraus.ideasonboard.com>
 <174a5210-8f77-4bd6-b091-ed5cc1ab899d@ideasonboard.com>
 <20260616123001.GC2984510@killaraus.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260616123001.GC2984510@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65019-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F190868FCB1

Hi,

On 16/06/2026 15:30, Laurent Pinchart wrote:
> On Tue, Jun 16, 2026 at 02:30:05PM +0300, Tomi Valkeinen wrote:
>> On 18/03/2026 23:16, Laurent Pinchart wrote:
>>> On Wed, Mar 11, 2026 at 03:53:19PM +0200, Tomi Valkeinen wrote:
>>>> Add v4l2_subdev_pad_ops.get_frame_desc() implementation.
>>>>
>>>> We also implement a fallback for the case where the upstream subdevice
>>>> does not implement .get_frame_desc. It assumes a single stream with VC =
>>>> 0 and DT based on the configured stream mbus format.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>> ---
>>>>    drivers/media/platform/renesas/rcar-csi2.c | 70 ++++++++++++++++++++++++++++++
>>>>    1 file changed, 70 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>>>> index ad62c95c8f9a..b8baf7c65e90 100644
>>>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>>>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>>>> @@ -1935,12 +1935,82 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>>>>    	return 0;
>>>>    }
>>>>    
>>>> +static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
>>>> +					 unsigned int pad,
>>>> +					 struct v4l2_mbus_frame_desc *fd)
>>>> +{
>>>> +	struct v4l2_subdev_route *route;
>>>> +	const struct rcar_csi2_format *format;
>>>> +	struct v4l2_subdev_state *state;
>>>> +	struct v4l2_mbus_framefmt *fmt;
>>>> +	int ret = 0;
>>>> +
>>>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>>>> +
>>>> +	if (state->routing.num_routes != 1) {
>>>> +		ret = -EINVAL;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	route = &state->routing.routes[0];
>>>> +
>>>> +	if (route->source_pad != pad) {
>>>> +		ret = -EINVAL;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
>>>> +					   route->sink_stream);
>>>> +	if (!fmt) {
>>>> +		ret = -EINVAL;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	format = rcsi2_code_to_fmt(fmt->code);
>>>> +	if (!format) {
>>>> +		ret = -EINVAL;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	fd->num_entries = 1;
>>>> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>>>> +	fd->entry[0].stream = route->source_stream;
>>>> +	fd->entry[0].pixelcode = fmt->code;
>>>> +	fd->entry[0].bus.csi2.vc = 0;
>>>> +	fd->entry[0].bus.csi2.dt = format->datatype;
>>>> +
>>>> +out:
>>>> +	v4l2_subdev_unlock_state(state);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>>>> +				struct v4l2_mbus_frame_desc *fd)
>>>> +{
>>>> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
>>>> +	int ret;
>>>> +
>>>> +	if (WARN_ON(!priv->info->use_isp))
>>>> +		return -ENOTTY;
>>>
>>> Why is that, can't the get frame desc operation be supported on Gen3 ?
>>
>> It can, and it is, in this patch. The thing here is that
>> rcsi2_get_frame_desc() is the implementation for
>> v4l2_subdev_pad_ops.get_frame_desc(). On gen4, csisp calls it, but on
>> gen3, there's no one to call it as on gen3 the csi2 does the demuxing.
>>
>> So the above check is just a "yell if our drivers do a totally wrong thing".
> 
> A comment would be useful.

Sure, I'll add one here.

>>>> +
>>>> +	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
>>>> +		return -EINVAL;
>>>> +
>>>> +	ret = v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
>>>> +	if (ret == -ENOIOCTLCMD)
>>>> +		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);
>>>
>>> A dev_warn_once() would be good here, to get people to fix the source
>>> device driver.
>>
>> Perhaps at some point, but do we want to add it already?
>>
>> Hmm, actually, this will go away with Sakari's series that adds
>> framework level fallback handling, so I think warning now about a thing
>> that is no longer a thing in the future serves no purpose.
> 
> Or you could consider that adding a dev_warn_once() isn't an issue as
> the code will be replaced soon :-) Up to you.

I meant that if we add dev_warn here, it'll start printing a warning "to 
get people to fix the source driver", but with Sakari's series that 
"fix" is not needed at all, so the people would end up doing unnecessary 
work.

  Tomi


