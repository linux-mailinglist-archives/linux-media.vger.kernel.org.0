Return-Path: <linux-media+bounces-25006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FBAA17513
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 00:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36E4916A51C
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 23:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07651EF0AC;
	Mon, 20 Jan 2025 23:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=littlefighter19@web.de header.b="jEnTTvd4"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605DC19342F
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 23:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737416805; cv=none; b=i065DrFRNjtzbz0ES5CJqBYsmuQ2P7aoLdxm/ZpvuJFX0pYJ9vXFJ3rf/DMAavqqtagJyu/bulk1Cc2a5UpHECU53p0GQHeLt8DLygKel9Ik8H4GJE7I2MVoOakxFxCe5hJ8dKta5R00Q8T7hMX83pPgql+c66GEPcNi4yKfdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737416805; c=relaxed/simple;
	bh=pL3yxHeCrban58HgK73OtQrfnckb4Jyj4eapcYH6Idc=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=aEX8e1PIFbDGMT0C0itxsBxzberKAD3IrbRC6kfxWNuHAbnG4MR7MQyq6gI80rfTiaQwuK8Yu+WGUukkKeyGpZwCVr1ImrV5vvFtl18kJZcravLapv1QZ+5TldboWV1EbwvDWVQ9BXXYtjWx5qvyUkBV70jraG0UMpU8/eRLfGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=littlefighter19@web.de header.b=jEnTTvd4; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1737416794; x=1738021594; i=littlefighter19@web.de;
	bh=pL3yxHeCrban58HgK73OtQrfnckb4Jyj4eapcYH6Idc=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jEnTTvd4lc3H+mnopX3goIUyHUVDNK4mmeeLoZu0u00aKGw5C/jpHgK04XsAvHgl
	 Qx49uPeOU1uO8yEotVpwi2z+6euPvOhIKGlpYKMF3c/1yVpzj2dxz2J/2HpMug+Gi
	 +iBQ6y/09DN+gjGrTrATLpv7obMQhDc75eKnMg87qKQNqbIiyvFV7v0GGO4bz5L9r
	 qN+Pj32yGjMJN2zPrJ7xx1KUprW5Ci8CleXnc7F2hn4L5JaP5ELULIGd3EEWV+TuX
	 1hnUqtt66MeF5oFtdfCjqOaEJKVpBnrdvucMiacd8r+pnqL3WZgI9ACTxFkQcjxbs
	 LA64BxCHYXiRSTlZKQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.138] ([178.27.166.126]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MpCmT-1tAJN701Rn-00j8zZ; Tue, 21
 Jan 2025 00:46:34 +0100
Content-Type: multipart/mixed; boundary="------------0Flc6Vqzh1SOGTJrltFivh50"
Message-ID: <b527d0a4-5a39-46ee-9f4f-8f10c5cc23b6@web.de>
Date: Tue, 21 Jan 2025 00:46:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mceusb: No keypresses on Formosa Infrared Receiver
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org
References: <f609b2e2-2c7f-4fcc-8f55-4b1c1f0e3671@web.de>
 <Z44W2kpjTpVvsrva@gofer.mess.org>
Content-Language: en-US
From: Patrick Zacharias <littlefighter19@web.de>
In-Reply-To: <Z44W2kpjTpVvsrva@gofer.mess.org>
X-Provags-ID: V03:K1:ZiCbu7D+fuHr26HxOkqjjnPYbQa62LceJtY4yn0HhtGQKV3MBAd
 bv9EOYleolIDOxLYVz8+nGk02zIDARd2D4T8sazkzp3zk/GjciEHzgHhuddPJH3A3sHNIx7
 K+/KzdZzB0AbWdszr8BTIEIJX5dUCA08VwY8dATuB0ACyiQZGsP78gfa7SLsnwleSa0JTiO
 dSN/iFji+h/9kwTZ8Lc8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XG3/0diLLmM=;tmzhLGhJ0mZof/LT7qKhUH9R2Kf
 hGe7wY9sW1JJK0vR9Gp6UYv+1Ju0H/OQragwr1vsVQbWyGicJx1Skt3afzEfPKTz2w5Av7gvC
 in5CfTAh0RA3zw7Q+O1UH+fGiYWAa1THZdG6hGfmU26jHHDIHf+BeD9hld+PEKiCAgw6P6sNH
 CQAmaDcO1YLZe0axHXiHdYg5wxf+DENAY2YOY+8MN5vwJfsgy2GUPQpT8vM3n3sO3+T0opIhV
 WKAX5PL3300j72KZ/Hv11wRvHCBdB66ErN41WUrxW4n1/EHyiYAGKzgo59/9ui4MizgDuyP8u
 0ZqHg4JwVFTkHQ+56OIZkWhbLacihMxtSKC7nuMIrKudXk/b1pkVMKjQNtyLmRODhZE4NsWVh
 yNdBxbbrEJnzEZ3nAMvv73kPdLmm9EzTWwnmfhHNbkKw/Kjk2lsVQIAxpRb7GoYJwAtF5PA3y
 1h4X0kbztSz3Q2/GjeMYE6m2FdxOF43WFu5utr6hYmJNVnB8JhBxjl5qlOXZulduzS7e4itiY
 zzobkgS/q7sVhujrYfUHiYufB9la7e7EScvz16izvOrjkenx+BQ8/KZzkQkWXip6NjnwNqgYF
 6/D9nXiD0DHoXbpSJoMRAs8B71aYe5PI5lc6KF1bfseKduTdO6KPZl0YFfSACak2JcJuX17Js
 IDtobpTPUZYbEL/NBTeJzKe9HxxxT6Chn3nDijFcMcPdIEOEel1SujUthK4dpLYujtxosM55V
 2JbhZsP6LLwra2Bfzex7gDUGvth6JU9/Lf4Idf1HMm+gz5ceJazMFDDxgdqJkpGea9K1gcocG
 T2E1KqaSjJSWaXx5cSSeapGYtlJydAox94n06UkI8waf6z/89o2FzafCBQC3f3dLrrNfEhzSw
 q5fjx4AG66R+5Y0UfzEDBuPIzKwTMWl9J027sS6ydzIWR8utyoDv12Q1EexIKiJkUFy8eccTY
 JrZBmuP98lb6mc4/q6dJ7seL19r3F5HhSRxyMAmr+m9kdHBWOVPEPMd+tICA2itxYwZML+a2I
 ioDoSGbZPri3qWWB8ZCTeW/AwvGqYISIZ5RAHoGs87Crbw/86lRitQJAiVO1/3w6yy6fXGGvj
 azifAceeApaw0N1viBo+utdKBDWpdzVy1l+cWkI4KmWidq9cW3ir/0MRD1C7nh+8JEgAE9gJj
 1x/U0VgYDg2Ks4zeJA175tXsDgwyk39fAbgsTpXGLtg==

This is a multi-part message in MIME format.
--------------0Flc6Vqzh1SOGTJrltFivh50
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hey there,

I'm attaching the PCAP files (inside the XZ compressed TAR archive).
The one named irplugged_in.pcap, is captured on a real Windows 7 machine
and should just contain the packets sent after the device has been
plugged in.
(So yes, the device probe should be included).
irplugged_in_ok_up.pcap contains a capture with an OK and an UP button
being pressed,
afterwards.

Noticeable is the fact, that it uses URB_INTERRUPT, but as that's not
reported via the descriptor,
the Kernel rejects such URBs from being sent. (IOCTL_USBFS_SUBMITURB
returns 22).
URB_BULK seems to work just fine, instead.
In fact, that's what QEMU appears to be doing, when using USB forwarding.
(I'm probably not saying anything new in this paragraph)

The URL to the thread:
https://www.vdr-portal.de/forum/thread/132405-fernbedienung-funktioniert-n=
icht-147a-e016-formosa-industrial-computing-inc-ehom/

I'll see if I can find the time to do a git bisect. :)

The receiver and remote look like this:
https://i.ebayimg.com/thumbs/images/g/j~YAAOSwoVti8OiU/s-l1200.jpg

Greetings,
Patrick

Am 20.01.25 um 10:26 schrieb Sean Young:
> Hi Patrick,
>
> On Sun, Jan 19, 2025 at 05:34:18PM +0100, Patrick Zacharias wrote:
>> Hello there,
>>
>> while using the Formos Infrared Receiver (147a:e016), I've noticed, tha=
t
>> it won't stop blinking and doesn't register any presses.
>> This issue appears to have been present since 2019,
>> according to a thread on a German VDR forum.
> That's interesting, mind sharing a link to the forum discussion please.
>
> Also what does the device look like, it would be useful to get it and
> test it myself if possible.
>
>> And appears to be a regression, as according to that thread it used to
>> work with their software
>> (yavdr-0.6.2, which appears to based on kernel 3.13.0).
> A git bisect would be useful.
>
>> I've tried this on 5.16-rc2 (mainline on an X86 machine) and with
>> 6.6.62+rpt-rpi-v8 from the latest Raspberry Pi OS.
>>
>> I've analyzed a PCAP dump from a Windows 7 machine to see where the
>> initialization differs and noticed,
>> that an undocumented byte 0xF4 is being sent, after DEVICE_RESUME and
>> G_REVISION (which are both sent in one packet).
> You mean during device probe?
>
>> By unbinding the driver, manually sending 0xF4 to the device and
>> rebinding the driver, I'm able to workaround this issue.
>> The blinking is gone and keypresses are now received. (Except for the O=
K
>> key).
>>
>> No further testing has been done.
>>
>> I'm willing to provide PCAP traces, if of interest.
> Yes please :)
>
> Thanks,
>
> Sean
>

--------------0Flc6Vqzh1SOGTJrltFivh50
Content-Type: application/x-xz; name="ir.tar.xz"
Content-Disposition: attachment; filename="ir.tar.xz"
Content-Transfer-Encoding: base64

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


--------------0Flc6Vqzh1SOGTJrltFivh50--

