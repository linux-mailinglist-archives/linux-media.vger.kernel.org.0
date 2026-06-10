Return-Path: <linux-media+bounces-64351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OmYeChkBKWrhOgMAu9opvQ
	(envelope-from <linux-media+bounces-64351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:15:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B44DC666226
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:15:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N2V7mD17;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64351-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64351-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E6613009CCB
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 06:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9625A35E931;
	Wed, 10 Jun 2026 06:15:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFB335FF6E;
	Wed, 10 Jun 2026 06:15:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072148; cv=none; b=XyMrPnQheC/0AZi0UdN0ONFjllaSjLRpB+AVGamlrvOp8YiK/aLRLFQ3IjNVc9OqxKm80EYXl6RFpSMXzL8Tv3I45DbESrSatRZr96aR3VnOw0SScFzxRSSb+zM7PR3A9z794ggno6HqLwyP0tTIlTIui0Nyz2TqoHTJ0YGws2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072148; c=relaxed/simple;
	bh=zUePosTIJHAQcCM2es+uBUsouLCrC8kCtLKkcCn95MM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nnZQjdbXuiQONg4vfkgIKYjtmvdMWggw+zX7Ni9TrFsbYpY5INz6X0cK/xJYbOFbYhYfJjKfIF2ZeEFpmUi3fFZ/P/fIzaKmrYR6N4qLV78o0bVx0rhe5dYrUswiGoV+afq/9fkCzZYgL6b2HhPqZ5U3EiSY/M6AKJf5SPmwxnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2V7mD17; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FEF1F00893;
	Wed, 10 Jun 2026 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781072146;
	bh=DrELCtHjhS82cKerG8sWq7g/ZPXCT14EwT4cwsAvqmk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=N2V7mD17zsyJom8eBA4HEeRybzKOBzxZXaLFBcT6NAy39q69mie3MsemTzWIHHNC1
	 tyMIJ1gmzy3rK/TBts6hlSPlH7xZRRydNd/Y5oWc1PdJt9ZQvxO72vjlnoMbjVCLq8
	 FX9bB5KTDn8CdnOW2H4Hg/Z86mOco17hLO5xUwuhMg6BvJT2V9MVbq/M1gyuCZP2rJ
	 CTp0KmcFax4dao9wMCS/sugWfzeVqWMjJPXAdIDURxWJ/sFsu+wwLtllF+ZJuzFNuj
	 /ZmLMLS/IvrRccdBW/4J6eE23SbSpvgK5sJti9NrwQ58cVALc/9S2a2RMz/ssuc3o+
	 2d6F1ypWt1QlA==
Message-ID: <349d6d48-9996-4791-833c-5c01e07883fd@kernel.org>
Date: Wed, 10 Jun 2026 08:15:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH RFC 1/2] media: docs: Clarify V4L2_FMT_FLAG_DYN_RESOLUTION
 usage
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
 "hverkuil@kernel.org" <hverkuil@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Eagle Zhou <eagle.zhou@nxp.com>, Elliot Chen <elliot.chen@nxp.com>,
 Frank Li <frank.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260608-flag-dyn-resolution-v1-1-44dc65516148@oss.nxp.com>
 <20260608040616.1A3EE1F00893@smtp.kernel.org>
 <AM9PR04MB857068E0FE59DD8ECB27A9AAE71C2@AM9PR04MB8570.eurprd04.prod.outlook.com>
 <e689df21c92861e35b6d11e391bea3404321484d.camel@collabora.com>
 <aijOPSFPEDsVlYFY@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
 <aijayrdr_rrz2x4B@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
Content-Language: en-US, nl
In-Reply-To: <aijayrdr_rrz2x4B@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:ming.qian@oss.nxp.com,m:nicolas.dufresne@collabora.com,m:sashiko-reviews@lists.linux.dev,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:imx@lists.linux.dev,m:Frank.Li@kernel.org,m:linux-media@vger.kernel.org,m:eagle.zhou@nxp.com,m:elliot.chen@nxp.com,m:frank.li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64351-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux.dev:email,nxp.com:email,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B44DC666226

On 10/06/2026 05:36, Ming Qian(OSS) wrote:
> On Wed, Jun 10, 2026 at 11:49:06AM +0900, Ming Qian(OSS) wrote:
>> On Tue, Jun 09, 2026 at 02:00:02PM -0400, Nicolas Dufresne wrote:
>>
>> Hi Nicolas,
> 
>>> Hi Ming,
>>>
>>> Le lundi 08 juin 2026 à 06:26 +0000, Ming Qian (OSS) a écrit :
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
>>>>> Sent: Monday, June 8, 2026 12:06 PM
>>>>> To: Ming Qian (OSS) <ming.qian@oss.nxp.com>
>>>>> Cc: imx@lists.linux.dev; Frank.Li@kernel.org; linux-media@vger.kernel.org
>>>>> Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
>>>>> V4L2_FMT_FLAG_DYN_RESOLUTION usage
>>>>>
>>>>> Thank you for your contribution! Sashiko AI review found 1 potential
>>>>> issue(s)
>>>>> to consider:
>>>>> - [High] The added documentation conflates
>>>>> `V4L2_FMT_FLAG_DYN_RESOLUTION` (which designates mid-stream dynamic
>>>>> resolution switching capability) with the mandatory initial
>>>>> `V4L2_EVENT_SOURCE_CHANGE` event. By stating "Clients can use this flag to
>>>>> determine whether the decoder will signal the initial resolution", it
>>>>> explicitly
>>>>> legitimizes a flawed userspace heuristic that violates the V4L2 stateful
>>>>> decoder
>>>>> specification. The specification mandates that for coded formats containing
>>>>> resolution info, the decoder MUST parse the stream and emit an initial
>>>>> `V4L2_EVENT_SOURCE_CHANGE` event (Initialization Step 4). Compliant drivers
>>>>> (e.g., `coda`) correctly emit this initial event but do NOT set
>>>>> `V4L2_FMT_FLAG_DYN_RESOLUTION` because they lack mid-stream switching
>>>>> capabilities. If userspace follows this documented advice, it will
>>>>> erroneously
>>>>> skip waiting for the initial event on these drivers, breaking Capture Setup
>>>>> and
>>>>> stream decoding.
>>>>> --
>>>>>
>>>>> commit ec9c0583334c246f7813132b55724e42622e8edd
>>>>> Author: Ming Qian <ming.qian@oss.nxp.com>
>>>>>
>>>>> media: docs: Clarify V4L2_FMT_FLAG_DYN_RESOLUTION usage
>>>>>
>>>>> This commit updates the V4L2 stateful decoder documentation to clarify the
>>>>> usage of the V4L2_FMT_FLAG_DYN_RESOLUTION flag. It adds a note stating
>>>>> that decoders setting this flag will always emit an initial source change
>>>>> event.
>>>>> The documentation suggests clients can use this flag to decide whether to
>>>>> wait
>>>>> for the initial resolution signal.
>>>>>
>>>>>> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>>>>> b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>>>>> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>>>>> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>>>>> @@ -361,6 +361,14 @@ Initialization
>>>>> [ ... ]
>>>>>> +    .. note::
>>>>>> +
>>>>>> +       Decoders that set the ``V4L2_FMT_FLAG_DYN_RESOLUTION`` flag for
>>>>> the
>>>>>> +       coded format will always emit an initial
>>>>> ``V4L2_EVENT_SOURCE_CHANGE``
>>>>>> +       event with ``V4L2_EVENT_SRC_CH_RESOLUTION`` during this phase.
>>>>> Clients
>>>>>> +       can use this flag to determine whether the decoder will signal the
>>>>>> +       initial resolution before producing decoded frames.
>>>>>
>>>>> [Severity: High]
>>>>> Does this guidance conflate the V4L2_FMT_FLAG_DYN_RESOLUTION flag,
>>>>> which designates mid-stream dynamic resolution switching, with the
>>>>> mandatory initial V4L2_EVENT_SOURCE_CHANGE event?
>>>>>
>>>>> The V4L2 Stateful Decoder API requires an initial
>>>>> V4L2_EVENT_SOURCE_CHANGE event during the Initialization phase for stream
>>>>> parsing, irrespective of dynamic resolution support.
>>>>>
>>>>> Compliant drivers like coda correctly emit this initial event but do not set
>>>>> V4L2_FMT_FLAG_DYN_RESOLUTION because they lack mid-stream switching
>>>>> capabilities.
>>>>>
>>>>> If userspace follows this documented advice, wouldn't it erroneously skip
>>>>> waiting for the initial event on these drivers, potentially breaking capture
>>>>> setup
>>>>> and stream decoding?
>>>>>
>>>>> --
>>>>> Sashiko AI review · https://sashiko.dev/#/patchset/20260608-flag-dyn-
>>>>> resolution-v1-0-44dc65516148@oss.nxp.com?part=1
>>>>
>>>> Hi,
>>>>
>>>> Thanks for the review.
>>>>
>>>> You are right that the V4L2 stateful decoder specification states the initial
>>>> V4L2_EVENT_SOURCE_CHANGE is mandatory for coded formats that contain
>>>> resolution information in the stream (Initialization Step 4).
>>>
>>> Be aware that Sashiko is an AI bot, llm words things with extreme conviction,
>>> and it this case forget about backward compatibility from pre-spec.
>>>
>>>>
>>>> However, in practice, GStreamer's v4l2 stateful decoder implementation uses
>>>> V4L2_FMT_FLAG_DYN_RESOLUTION to determine whether to subscribe and wait for
>>>> the initial source change event. The reasoning from the GStreamer side, as
>>>> Nicolas explained [1]:
>>>>
>>>>   
>>>> "
>>>> https://docs.kernel.org/userspace-api/media/v4l/dev-decoder.html#dynamic-resolu
>>>> tion-change
>>>>     Says:
>>>>         Not all decoders can detect resolution changes. Those that do set the
>>>>         V4L2_FMT_FLAG_DYN_RESOLUTION flag.
>>>>
>>>>     So normally that wording should prevent requiring an initial SRC_CH,
>>>>     or emitting later SRC_CH. Your driver don't have this flag, then your
>>>>     driver can't emit this event. But a measure we should take into
>>>>     GStreamer would be to not register (or mark) this event."
>>>>
>>>> @Nicolas, could you elaborate on why GStreamer needs
>>>> V4L2_FMT_FLAG_DYN_RESOLUTION to handle the initial source change event?
>>>> Is this something that should be fixed on the GStreamer side (i.e., always
>>>> wait for the initial event), or is the current heuristic intentional due to
>>>> legacy drivers that don't emit the event?
>>>
>>> The coda source_change notification is completely fake. It does not dependent on
>>> the bitstream content. So the event is left there, since its kind of part of the
>>> ABI, but it does not behave like other implementation, or pre-spec drivers.
>>>
>>> So what we do in GStreamer, is that for legacy driver (no
>>> V4L2_FMT_FLAG_DYN_RESOLUTION), we pre-allocate both queues, based on our guessed
>>> dimensions. If it happens that the conformance windows is small enough, it often
>>> works. DRC will only work if the display dimension changes.
>>>
>>> For any modern driver, that implement V4L2_FMT_FLAG_DYN_RESOLUTION, we strictly
>>> wait for the event, and on DRC, even if the display resolution changes, we let
>>> the driver tell us when to actually reconfigure. The legacy method was kept to
>>> not break coda and older driver, the new method is a lot more reliable, and
>>> avoid allocating twice the capture queue (wrong guess).
>>>
>>> The userspace implementation is also a bit more flexible, as normally the legacy
>>> way should kind of work for any drivers, and we still subscribe it seems. But
>>> the implication is just strange and shouldn't be needed in drivers with
>>> V4L2_FMT_FLAG_DYN_RESOLUTION support.
>>>
>>> Nicolas
>>>
>>>
>>
>> Thanks for the detailed explanation of GStreamer's approach.
>>
>> I have a couple of follow-up questions:
>>
>> 1. Regarding coda's source change being "completely fake":
>>
>>    Looking at the coda driver code, its seq_init_work does parse the
>>    bitstream via hardware (SEQ_INIT command), and the source change event
>>    is only emitted after ctx->initialized is set — which requires the
>>    hardware to successfully parse the stream headers. After the event,
>>    userspace can call G_SELECTION to retrieve the actual display crop
>>    rectangle parsed from the bitstream.
>>
>>    The limitation is that coda requires userspace to set a sufficiently
>>    large resolution via S_FMT(OUTPUT) beforehand (since it validates
>>    stream dimensions fit within the pre-configured buffer size rather
>>    than updating G_FMT with parsed dimensions). But the event itself
>>    does depend on bitstream content and carries useful information
>>    (visible resolution via selection API).
>>
>>    So it seems coda could work with the standard init flow — the source
>>    change event is real, just the information delivery is partial (crop
>>    via G_SELECTION rather than full coded resolution via G_FMT). Would
>>    you agree, or is there another reason GStreamer treats it as legacy?
>>
>> 2. Regarding s5p-mfc:
>>
>>    Interestingly, s5p-mfc sets V4L2_FMT_FLAG_DYN_RESOLUTION but does
>>    NOT emit an initial source change event. After SEQ_DONE, it simply
>>    transitions to MFCINST_HEAD_PARSED state and wakes up waiters —
>>    userspace discovers the resolution by calling G_FMT(CAPTURE) which
>>    internally blocks until header parsing completes.
>>
>>    The source change event is only emitted during mid-stream resolution
>>    changes (RES_CHANGE_FLUSH path). How does GStreamer handle this case?
>>    Does it timeout waiting for the initial event and fall back, or does
>>    it use some other mechanism?
>>
>> Overall, I agree that using V4L2_FMT_FLAG_DYN_RESOLUTION to unify the
>> behavior (both initial source change and mid-stream DRC) is the right
>> direction. But the current state has some inconsistencies:
>>
>>   - coda: emits initial source change, but does NOT set DYN_RESOLUTION
>>   - s5p-mfc: sets DYN_RESOLUTION, but does NOT emit initial source change
>>
>> If we want to document that "DYN_RESOLUTION implies initial source change
>> event will be emitted", s5p-mfc would need to be fixed to comply. Does
>> that seem reasonable, or should we take a different approach?
> 
> Hi,
> 
> I'd like to follow up with a correction regarding the s5p-mfc driver.
> 
> I apologize for the confusion in my earlier analysis. The s5p-mfc driver
> does define V4L2_FMT_FLAG_DYN_RESOLUTION in its internal formats[]
> table. However, the vidioc_enum_fmt() implementation never copies these
> flags to userspace:
> 
>   f->pixelformat = formats[i].fourcc;
>   return 0;  /* f->flags is never set! */
> 
> This is a bug - from userspace's perspective, VIDIOC_ENUM_FMT always
> returns flags = 0, which is why GStreamer treats s5p-mfc via the legacy
> path.
> 
> Looking at the driver's actual behavior:
> 
> - Initial resolution: After header parsing, the driver wakes up the
>   waiting context but does not send V4L2_EVENT_SOURCE_CHANGE. Userspace
>   discovers the resolution by calling G_FMT after STREAMON.
> 
> - Mid-stream resolution change: The driver does send
>   V4L2_EVENT_SOURCE_CHANGE with V4L2_EVENT_SRC_CH_RESOLUTION.
> 
> So if V4L2_FMT_FLAG_DYN_RESOLUTION is defined to cover both initial and
> mid-stream resolution changes:
> 
> - It should not set the flag - because it doesn't fire the event for
>   initial resolution.
> - It should set the flag - because it supports mid-stream DRC via the
>   event.
> 
> Neither setting nor clearing the flag accurately describes the driver's
> current behavior.
> 
> The more natural fix would be to add V4L2_EVENT_SOURCE_CHANGE for the
> initial resolution case as well, then properly report
> V4L2_FMT_FLAG_DYN_RESOLUTION through VIDIOC_ENUM_FMT. If all existing
> drivers that support mid-stream DRC can similarly be updated to fire the
> event for initial resolution, then perhaps the spec change to split the
> flag isn't strictly necessary - drivers just need to be fixed to comply
> with the current definition.
> 
> I'd appreciate hearing others' thoughts on whether this unified approach
> is practical across all existing drivers.

Just a quick reply to mention that the s5p-mfc driver predates a lot of the
newer uAPIs for stateful codecs. It's why it behaves in a not-quite-standard
way. So there is history here. The resolution change support was added in
commit 0520e4cc3bb9d back in 2014, three years after the driver was first
added to the kernel. The stateful decoder spec as we have today was only
introduced in 2019.

Regards,

	Hans

> 
> Best regards,
> Ming
> 
>>
>> Regards,
>> Ming
>>
>>>
>>>>
>>>> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5126
>>>>
>>>> Best regards,
>>>> Ming
>>
>>
>>
> 


