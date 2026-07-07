Return-Path: <linux-media+bounces-66824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bsUwNv7GTGpspgEAu9opvQ
	(envelope-from <linux-media+bounces-66824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 11:29:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 763B2719C81
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 11:29:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=R6aAGpId;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66824-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66824-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F7A530A4A26
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 09:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D650037F72C;
	Tue,  7 Jul 2026 09:22:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36935391E44;
	Tue,  7 Jul 2026 09:22:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416144; cv=none; b=pVFX7RIzTdOQ30jaqlyf/iIJIZr6DJ3Yzq9uu8bVAul5TwdthHZ260k/ld/JezJfqm26EnhZB5KgohYaGZTOmc86jY8kv8qQ0dSnLJhtO0B940DH/z7xKXBz414/BsCz1tRD7XmpF2ElNkDBkut1t75MWBJPNNjY9jcm12/kEFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416144; c=relaxed/simple;
	bh=sd1deNal57NEHAP2Spr4Q+C5I3hHJTEdVeO5/Cxr4+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uySB6dyodtQqK2vRJwMIoa0wmEZopdIUo4ZYbt09RIljJbXOIO18G4SYA0FSM/7foX11+aXPHETlwI7l91NwogPuo83wB2DAidO7vx6icLqomh+0xMWc6uceYIZodV1ZNOsI+NVrAmKhXTTK6JDuBndIR/Xymu9TQJyuHH5V9P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=R6aAGpId; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5FTi8Mcjhkp1s4ZA67gqJXo3xQL1HNlKoGId7XEzJC0=; b=R6aAGpIdsRbOWzvrYHCu5CWmtZ
	D0q24Ya9J3+WSEUhWooOEvEKpxlMVSa53pcYD5+0a8d+n+SKFoYqrChB/IIWBpb0SGA7aI/H2Nf/3
	l/Naw8SsdtDGVrz80gOTpFLS0g0YfZcMUW04iyAscahFi1CfHywfBe3NZ0dWaWdx4o/D2qlEbQI6Y
	Qfwu6sB8qqPFHvN6KlwVVtxX8jbbkw6g3Yc9a1Z4/zUXKtZcjyQljKIhcXssJ6xOKaNb4pcusXg1Z
	AxgXoQJ9n4gZg8FppVoeM0noW6+VFREVM2p4VkbFmssPc7YqteC/yQnlAiWBQiCxGrp84JybsI0mR
	uXtxlbqg==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wh204-00AWD1-1l; Tue, 07 Jul 2026 11:21:56 +0200
Message-ID: <9e6c5123-f8b2-4a06-9fb0-be84c39ddd77@igalia.com>
Date: Tue, 7 Jul 2026 10:21:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/sched: Protect entity->last_scheduled with
 spinlock
To: phasta@kernel.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Marco Pagani
 <marco.pagani@linux.dev>, Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260701085920.3253248-2-phasta@kernel.org>
 <20260701085920.3253248-3-phasta@kernel.org>
 <a4091099-1931-4ca2-a81a-9c3321b123a8@ursulin.net>
 <51fbde808bd059510d667d130afae179626303be.camel@mailbox.org>
 <ce33edbb-11dd-4722-bb87-d16155f35a75@igalia.com>
 <e9e12e30-80c1-4650-9d71-4107517bc956@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <e9e12e30-80c1-4650-9d71-4107517bc956@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66824-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ursulin.net,intel.com,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org,linux.dev,collabora.com];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:tursulin@ursulin.net,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:marco.pagani@linux.dev,m:boris.brezillon@collabora.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,igalia.com:mid,igalia.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 763B2719C81


On 06/07/2026 15:37, Tvrtko Ursulin wrote:
> 
> 
> On 06/07/2026 09:45, Tvrtko Ursulin wrote:
>>
>> On 03/07/2026 15:47, Philipp Stanner wrote:
>>> On Fri, 2026-07-03 at 12:27 +0100, Tvrtko Ursulin wrote:
> 
> 8><
> 
>>>> I am also happy to give it a spin on the Steam Deck to see if I can
>>>> observe anything.
>>>
>>> Could be interesting.
>>
>> Okay I'll try to do it in reasonable time. You can either respin or 
>> wait for it, I don't mind either way.
> 
> On the topic of benchmarking, I gave it a quick spin against four unsync 
> instances of vkgears. Point being seeing if something can be shown on 
> more datacenter deployments with many cores submitting and large 
> aggregate "fps".
> 
> x stock.fps
> + phasta.fps
> +----------------------------------------------------------------------+
> |                              +                                       |
> |                           +  ++                                      |
> |                           +  ++                                      |
> |                       +   +  ++ +  x                                 |
> |                       + + +  ++ +  x                                 |
> |                    +  +++ + +++ +  x                                 |
> |                    +  +++ +++++ +x x                                 |
> |                    +  +++ +++++++x x *                               |
> |                   ++  +++ +++++++x *x*xx    x                        |
> |                   ++  +++x+++++++xx*x**x    x                        |
> |                   ++  +*+*+++*+++xx*x*** x xx                        |
> |               x  +++  +*+*+*+**+*x******xxxxx                        |
> |            x  xx**++  **+*+****+********xxxxx x    x                 |
> |        x  +xx xx**++ +******************xxxxxxx x  xx                |
> |      x xxx**x x**************************xx*xxx xxxxx                |
> |xx    xxxxx**x*****************************x**x**x*x*x   x x x  x    x|
> |                    ||_______A___A_M|________|                        |
> +----------------------------------------------------------------------+
>      N           Min           Max        Median           Avg        
> Stddev
> x 218      5446.984      5862.578      5656.121     5642.9429     76.667613
> + 227      5510.432      5762.926      5620.999     5620.3585     45.407235
> Difference at 95.0% confidence
>      -22.5844 +/- 11.6534
>      -0.400224% +/- 0.206513%
>      (Student's t, pooled s = 62.6985)
> 
> Numbers are average FPS per vkgears instance. Total run each is around 
> 40 seconds.
> 
> More locking does appear to show a small decrease in throughput and, 
> curiously, a tighter range between min and max. Whether or not that is 
> telling us something about the lock cycles and inter core 
> synchronisation I am not sure. Could be just noise and that more runs 
> are needed. I can do that tomorrow.

I think it's noise. Repeated much longer run, with double the clients, 
and this time round got this:

     N           Min           Max        Median           Avg        Stddev
x 900      2483.751      2796.339      2620.184     2623.3684     49.850651
+ 900      2496.926      2773.642      2633.114     2632.9949     48.848675
Difference at 95.0% confidence
	9.6265 +/- 4.55991
	0.366952% +/- 0.173819%
	(Student's t, pooled s = 49.3522)

So it flip-flopped compared to the last run with a similar relative 
difference.

Therefore, for what I am concerned, it is okay to go ahead with this 
simplification. Apart from the improved commit message I think Christian 
should still ack on behalf of AMD though.

Regards,

Tvrtko


