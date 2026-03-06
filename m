Return-Path: <linux-media+bounces-54840-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFKGIVRoq2l4cwEAu9opvQ
	(envelope-from <linux-media+bounces-54840-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 00:50:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE24B228DCA
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 00:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 366CB3022906
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 23:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0273A5E83;
	Fri,  6 Mar 2026 23:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="WLz4UxpZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B274735DA71
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 23:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772841033; cv=none; b=lM1At9ODoo+bpb9xh14VoCJeZfctgciyjUXyZpkpSwTnEctmFeUIQQZ8wZ2HE6zuQuthagP14OJTC5Zv7dZ3dqRNNyiNelNmwbRuMgptdgd9kLAL+4gabcRQreFCnjOPBaEabrKkSqmMENrAM7KhU7/GCheUeIV9hYHIda2QD9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772841033; c=relaxed/simple;
	bh=kg8aIkN5/Mlt50kCLPideDh+dyMujVE5N17P9dlBFOA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jhU6TEUyhfNtRkGlczHZQeFbIx1RRiGdCZ7E+wISTo6CyKZDWsZdsCf87gzgA0pKg7ieBvErQu2ymoscyoqR0zAg99t4bKI0fjS5EML9I2mCdB6tz48rnUSJk+S2Ei18N5pV6du4fCHXxiqE3MxmSbK1TlmEc8ZaNj7hXTGuV9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=WLz4UxpZ; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: References: Cc:
 To: From: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1772841025;
 bh=7TpbWWX1cj1QogQtOXMz884aeH8NNZvqQ7fJ4Elb1a4=;
 b=WLz4UxpZz2cHHWeIlEpaCrfGVGI6FsAwm7Uvq+dNTfgASzhQLiBkt9QYdpJ0q8WPyOaF8Yqzl
 wOwQWc8akhsYi94HwyDVYK/UPVgPIEnZM1ru9OE4X7hDztLtE4ChcS5MQxVFNlDe2mnAeDxPsjZ
 dzQqhWgpo9+L5RhImdSwRMU4s1Z/boRMRKDRlJ1nDPRqGPjfSwZFQc7gTavlaDz9qYCCC34NXww
 aA7aURNXjEPkZwEeok+dNx844lSZFcUBqv3Hj8GuCpyK0oQ8xA6ud76HLCuaP2Bat/kbZgEcOeB
 2J5gPvwjelC4ORK3nbojiOKMqo62Bq85wMDi5pfkRyiw==
X-Forward-Email-ID: 69ab683dce06037f1b6bb7be
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <3a42ce98-b552-43d2-aaf3-8ca071c3afd3@kwiboo.se>
Date: Sat, 7 Mar 2026 00:50:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] Raspberry Pi HEVC decoder driver
From: Jonas Karlman <jonas@kwiboo.se>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 review list <kernel-list@raspberrypi.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
 <1d666c43-688b-4cc1-aeed-5296d2608327@kwiboo.se>
Content-Language: en-US
In-Reply-To: <1d666c43-688b-4cc1-aeed-5296d2608327@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EE24B228DCA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kwiboo.se,quarantine];
	R_DKIM_ALLOW(-0.20)[kwiboo.se:s=fe-e1b5cab7be];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54840-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[raspberrypi.com,linux.intel.com,ideasonboard.com,kernel.org,broadcom.com,vanguardiasur.com.ar,collabora.com,kynesim.co.uk,gmx.net,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonas@kwiboo.se,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kwiboo.se:+];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ffmpeg.org:url,kwiboo.se:dkim,kwiboo.se:mid]
X-Rspamd-Action: no action

Hi again,

[snip]

>> Testing is with a downstream patchset to FFmpeg. I'm told FFmpeg
>> currently has no stateless decode support, but we will be reviewing
>> works that have been in progress and our downstream patches to see
>> whether that can be pushed onwards.
> 
> Please see FFmpeg PR20847 "Add V4L2 Request API hwaccels for MPEG2,
> H.264, HEVC, VP8, VP9 and AV1" [1] for pending upstream FFmpeg work.
> 
> My 4l2request-v3-pixfmts branch [2] also contains extra commit to make
> it work with downstream rpi kernel version, using non-MT pixfmts.
> 
> I will give this a spin together with the FFmpeg PR, adding support for
> the MT based pixfmts should hopefully be easy.

My FFmpeg v4l2request-v3-pixfmts branch [2] got a small update that adds
support for this decoder and pix formats. Tested on a rpi5 using the
downstream rpi-6.18 kernel and kodi-gbm for visual playback confirmation.

  [AVHWFramesContext @ 0x7ffeb81abc50] Using V4L2 media driver rpi-hevc-dec (6.18.15) for S265
  [AVHWFramesContext @ 0x7ffeb81abc50] Using CAPTURE buffer format Nc12 (1920x1088)
  [V4L2RequestContext @ 0x7ffeb81abb00] frame-based decoder with SLICE_PARAMS=600, ENTRY_POINT_OFFSETS=0 and SCALING_MATRIX=1 controls

Will update the main FFmpeg PR (and backport branches) with the required
changes after some more testing.

Regards,
Jonas

> [1] https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/20847
> [2] https://code.ffmpeg.org/Kwiboo/FFmpeg/commits/branch/v4l2request-v3-pixfmts
> 
> Regards,
> Jonas

[snip]

