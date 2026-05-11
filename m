Return-Path: <linux-media+bounces-61129-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMM/HRfdAWptlgEAu9opvQ
	(envelope-from <linux-media+bounces-61129-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:43:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 283AF50F31B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 009E6302842B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 13:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2553EF679;
	Mon, 11 May 2026 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILkNvYhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcO77AGT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8913EF674
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506731; cv=none; b=kA77/b5Mdc8Z4FK2PZk9NW03iKnV5cDJutLAkAZjrdH1pkLkKGJRFBZOy7usDqMXR/hoBAKCxPbabVrrksDkhapaVpwgHFcnbV+rSKCTZDv7w7stVw063SrPrG4ycdAzesOlHl2mMgwqi41awh90+++jdZDAEbUh7aBNcFld0ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506731; c=relaxed/simple;
	bh=klB2oq8mKvj+HTVmXc1AvORkjsv0rdjLQwek2ckCQ2Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jVkNMskVu4YmGNerdCiUwRPfwE8LGNNfi7zg8GpAiq0/z6Gm9kayHPljxdEaoahYCmSKIiKVBPXoVLCLW3H7Vz4eQyIAxB8/zSgJVL2qGsAYJE0JrCpkJciaCNQT0VAOhpzKst4hWNggiWjbMZ9TsIK07Qx6oy1D3e/3sJf5zXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILkNvYhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcO77AGT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BC4N0i1106438
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 13:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzKsuLfrkj1YV9gLzUqg3fxpphqyIyag8pegTS5fhnA=; b=ILkNvYhNQyR+PmSP
	EesbaniDyBS5a3yrM+oWXRwoAHBypFu67KJktO3WAtNFg2aPlvm/tj288cWlRQty
	gjZGSr2gZwRNcOLsl/kdrptvhXhhSBJn9QlWW/3iTpYtr2ADMqQyWqPt87w+EtVP
	QwiDicLmtbCq13w3/XZeyyxmo72TcaYt/etd/nmBw3fuirpto+WMoMX3ltpz2jIb
	E7ytzOVfrZU8FBNP9Q3I3mc+JIwOeep94YmXl0aEc+deWV/eKWexV2Qg/FmZsCN+
	qt1KHd3B//tnvE9MyOj4/p6nT4zEZPw7MJ0Nw1uVC7XgPqPgSPJsRnlbGUeWCeUO
	r/C5og==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3esr8b4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 13:38:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5d1c2289so3699671cf.2
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778506728; x=1779111528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IzKsuLfrkj1YV9gLzUqg3fxpphqyIyag8pegTS5fhnA=;
        b=fcO77AGTfdmr+IZtEZRyLEX+o1n1kgdUESy1yw57BcYZFcGT4ATuVrsBmYtqFA7L6a
         FgNUvm3SmPfcG3Fdxet1fkJqGls0ZNpazfRJlw0T58UEsbkn7y3Ebyy8elYboDfl7DZs
         j65pb18L1nFdbqgw4jpIu8R8Q8zsiEdJWgmtxw2KVEnmjgpMYCT5NOMReh8W6BziDzcP
         2Wbejpg0GdVCEU/F2t5OWnQv6tjqgEgsH7p96Y5EiCY+1wAO4XaiyBPfFvPJL9z1dow/
         zEhau+OL7d+UXXwQ7hr3KhNoMFstpEaf/mQxCbA7ZuC1yeUuOen9wc/jrdfUedD54QGE
         7m4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506728; x=1779111528;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzKsuLfrkj1YV9gLzUqg3fxpphqyIyag8pegTS5fhnA=;
        b=ZsIlSevTgBbGF6qyxdvqiDR6q4mwGy/qkFHmnn4uSq0zwdaB08n8I11FAFRL+0svN4
         jCYg6id6raWWRA4lyZ51W7fhGnk5fBAz1QcPTNbo4dTYcuJAD0bAE2yyQmugP1yLSmGA
         vW14PbCY9iJV7xyXFWoXU/mRWN1O1dEjZ4l5gzn/dyzvpPz8Qfn3DszRM9FO5O/Q9ZFX
         4cBdhLS9Z7oV+bAmEGHr72Jmv26WH3p2hH0KdjbWdKNqYSIs38YKghiDBGHwUSoXjUSD
         am4fCmF+RtmME7ve+0QkYEqIBg8DE92mm2YfCYgbYhSQHPkzPch7rkGT162cuRchvHaf
         w1Pg==
X-Gm-Message-State: AOJu0Yy4agLC55h8ayanprg7+mqPLfhV6vJ+AxdRxLdPokwWr0GZzp/p
	WEVsaVBCuzZvgpDrZS1hzr9omrk4QUrgJrjZIE1V4ndOJl1Gl0LfGDg14ylEgfNL1pyuwfarL8H
	5isMVuCrQRtL9jLrupmhUXHDPaceTPh1PaLBTBIYBPtvfuuPKx/U8UC/TmVHwHwkAOWUvxKbJdA
	==
X-Gm-Gg: Acq92OGuV7m8JFDJ2kAQX6QS/Qt0XOgZsAq+f/O5GGut0hb02C8kc0IpCx+RYTRn6VO
	QvV862GBlMZd6o7CbxOz11rnaRNqG0GLpaqGlQhtW7SvQiXuc0Jl/6nGQL5QQAXL8jwIFr2BNq9
	mbfQqKkgpx7W5dnMFxfPTgMeZrqcJgS/feKFX60eIn9crNQV3SEL4etTYPAyBf2e8jgDIp/Hnra
	hUGn2vUvMJ6q6dSeepzqfudExQ6No+YdxYErCeDXks57XSjKhHYz7ZrE2EgcexRA9PHs2c9MjH7
	Uqw2K3XWklEzjl22xLX74Tnc3tCc6Mmn3VCBkO+Qhob1OyvDw640eJFNgJQSwE2EKkbnORxsvSf
	02wNro3wwq63cnjHYUksFpPWkm3Yfsh5p7znMl4OVLLGz3+ezEcHdhK4s2Q7MSCjWfywESj3PAd
	zt/eF+gWZxQNyesdyHf4vMHV5XEhyA/4JoWgAcaDUoPIOTXc5at7Zo9kwrta781hV3cv32u394O
	mgaTMVRDd9/u8NCZCRMD3SCBL0=
X-Received: by 2002:a05:622a:4a86:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-5148e9d2bacmr194045831cf.55.1778506727558;
        Mon, 11 May 2026 06:38:47 -0700 (PDT)
X-Received: by 2002:a05:622a:4a86:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-5148e9d2bacmr194045101cf.55.1778506726801;
        Mon, 11 May 2026 06:38:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a11asm3763468a12.8.2026.05.11.06.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 06:38:44 -0700 (PDT)
Message-ID: <3435be4c-f11d-4206-89a6-9fd16877f27d@oss.qualcomm.com>
Date: Mon, 11 May 2026 15:38:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: uvc_video issue: Panasonic S1II initialization fails in webcam
 mode
To: Lynne <dev@lynne.ee>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
References: <91137e13-102b-41a6-8f14-14fb33a3e554@lynne.ee>
 <20251122151401.GC15447@pendragon.ideasonboard.com>
 <7ce47ae4-f45d-49f6-919d-98f301aaaa75@lynne.ee>
 <4402b9bd-b74d-4a92-90b6-3edd38db8cc9@oss.qualcomm.com>
 <b8e02d7c-2dd6-4445-8315-b157ed434201@lynne.ee>
Content-Language: en-US, nl
In-Reply-To: <b8e02d7c-2dd6-4445-8315-b157ed434201@lynne.ee>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BqHkk_9mIJfBXxoW1vtr3T5hRUcRD4s9
X-Proofpoint-ORIG-GUID: BqHkk_9mIJfBXxoW1vtr3T5hRUcRD4s9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1MSBTYWx0ZWRfX4orxH0lyyD6u
 5qDZJWO6VHCCFeVkIU0s2eWOmYGD3n9YG09SdCLgbBkn4Yb/hYYRDpsYFwOnEtxQcbzmmR8uVd0
 oCNwl+pkMttfgzW5eq7F8Qsd5+T3RmAJgJ8o0WrNkEruQJ3a/vDPf3ELu+elU5gNEIGcxW4mLY/
 ZxejDzYCHbByT+C/uVNbblnGm4rHGMw8VlGnG9/HJmTqQhLe6Dplz1jG3N3vGhzVylH+jQAxluJ
 UAzAgpHC9s/ti7BIlcFFRoIh6nhtGQrSsNVOFAtW0/elbTMPyepqXWLeA/R+y6AeBvPpXUJ2ujd
 14L/MAVO5LlDb68YncEqTlRwxFNCms8Rd+p42e0dE1BA/aSkw9UDlsMLxjjt81e9iqCdjY6YySH
 YlUBF1aSR8G++7lUsN5dp/TtmS6SlM8aV3SDbzHRau5i0M8zY+a9DbVnBJTLjfXrHBtfG7BHcCR
 PoR720QCzKp1tQE77FQ==
X-Authority-Analysis: v=2.4 cv=G40s1dk5 c=1 sm=1 tr=0 ts=6a01dbe9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7tse_IdpoXUiLktboWcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110151
X-Rspamd-Queue-Id: 283AF50F31B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-61129-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Lynne,

On 8-Dec-25 23:04, Lynne wrote:
> Hi,
> 
> I can confirm that unloading the module between each hotplug attempt works, even if the camera is kept powered up.
> 
> Keep in mind the camera does not enumerate as a USB device immediately, but the user has to press a single button on a popup menu to enable webcam mode. Its possible they may be powering down the USB controller when it isn't needed, though I doubt it.
> 
> It does look timing issues. If you have some patches, I could test them.
> Thanks for looking into it.

Sorry for being really slow to reply to this.

It sounds like a firmware issue on the camera side, and
I'm afraid I don't really have a good idea how to fix this
from the Linux side...

Regards,

Hans





> 
> On 08/12/2025 11:41, johannes.goede@oss.qualcomm.com wrote:
>> Hi,
>>
>> On 22-Nov-25 6:58 PM, Lynne wrote:
>>> On 22/11/2025 16:14, Laurent Pinchart wrote:
>>>> Hi Lynne,
>>>>
>>>> On Sat, Nov 22, 2025 at 12:28:48PM +0100, Lynne wrote:
>>>>> The issue I'd like to report is that the kernel fails to initialize the
>>>>> Panasonic S1II DSLR camera in webcam mode as a webcam.
>>>>> Seems like most queries time out or error out with a generic protocol
>>>>> error return.
>>>>> I tried increasing UVC_CTRL_CONTROL_TIMEOUT just in case, but it did not
>>>>> seem to help.
>>>>
>>>> I see in the log that the USB audio driver fails as well. There are
>>>> quite a few devices that exhibit issues in the interactions between the
>>>> audio and video interfaces. Could you test blacklisting the
>>>> snd_usb_audio module to prevent it from loading (and unloading it if
>>>> it's loaded already), and replug your camera ?
>>>
>>> Hi,
>>> I dug around some more. When the device is first connected, everything runs fine, actually. Upon unplugging and plugging it back in, I get the log I posted initially. Unloading the uvcvideo/uvc moedule and loading it makes the camera work again.
>>> Disabling snd_usb_audio did not help.
>>>
>>> Here's the log of the device being plugged in for the first time.
>>> <same as before>
>>> [  +0.000001] usb 2-3: SerialNumber: 00000Z12FB009251
>>> [  +0.094425] videodev: Linux video capture interface: v2.00
>>> [  +0.017217] usb 2-3: Found UVC 1.10 device DC-S1M2 (04da:2385)
>>> [  +0.000493] usb 2-3: Failed to query (GET_INFO) UVC error code control 2 on unit 2: -32 (exp. 1).
>>> [  +0.000264] usb 2-3: Failed to query (GET_INFO) UVC error code control 2 on unit 1: -32 (exp. 1).
>>> [  +0.000407] usbcore: registered new interface driver uvcvideo
>>> [  +0.007960] usb 2-3: Failed to query (GET_DEF) UVC error code control 2 on unit 2: -32 (exp. 1).
>>> [  +0.000004] usb 2-3: UVC non compliance: permanently disabling control 980900 (Brightness), due to error -32
>>> [  +0.000425] usb 2-3: Failed to query (GET_DEF) UVC error code control 2 on unit 1: -32 (exp. 1).
>>> [  +0.000001] usb 2-3: UVC non compliance: permanently disabling control 9a0901 (Auto Exposure), due to error -32
>>> [  +1.091011] usb 2-3: Failed to query (GET_DEF) UVC error code control 2 on unit 2: -32 (exp. 1).
>>> [  +0.000442] usb 2-3: Failed to query (GET_DEF) UVC error code control 2 on unit 1: -32 (exp. 1).
>>> [  +0.000762] usb 2-3: Failed to query (GET_DEF) UVC error code control 2 on unit 2: -32 (exp. 1).
>>> [  +0.000426] usb 2-3: Failed to query (GET_DEF) UVC error code control 2 on unit 1: -32 (exp. 1).
>>> [Nov22 18:50] usb 2-3: USB disconnect, device number 2
>>>
>>> Maybe some state gets corrupted?
>>
>> I think this maybe a timing issue, where if we talk to the device to quickly after
>> plugging in it is unhappy.
>>
>> The first time there will be some delay because the uvcvideo module needs to be loaded.
>>
>> Can you try the following:
>>
>> 1. 'echo blacklist uvcvideo | sudo tee /etc/modprobe.d/uvcvideo-blacklist.conf'
>> 2. 'sudo rmmod uvcvideo'
>> 3. plugin the camera, then wait 1 second
>> 4. 'sudo modprobe uvcvideo'
>> 5. Camera now works?
>> 6. unplug the camera
>> 7. 'sudo rmmod uvcvideo'
>> 8. plugin the camera, then wait 1 second
>> 9. 'sudo modprobe uvcvideo'
>>
>> If the camera now works on the second plugin then we've some timing issue.
>>
>> If it does not work then try:
>>
>> 1. unplug the camera
>> 2. turn the camera fully off
>> 3. wait 10 seconds
>> 4. turn the camera back on
>> 5. plug in the camera
>>
>> Since it may also be the case that the camera fw somehow ends up in a bad state after
>> being plugged in once and that the camera fw needs to be reset before plugging it in
>> a second time.
>>
>> When you plug in the camera the first time and it works properly, was the camera
>> on when you plugged it in; or did you plug it on while the camera was off and
>> did plugging it in wake it up (or did you turn it on after plugging it in)?
>>
>> It might also make a difference of if you plugin first and then turn on
>> the camera vs plugging in while the camera is already on.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>>
>>>>> Full log is below:
>>>>>
>>>>> [Nov22 12:11] usb 4-4: new SuperSpeed Plus Gen 2x1 USB device number 10 using xhci_hcd
>>>>> [  +0.017315] usb 4-4: New USB device found, idVendor=04da, idProduct=2385, bcdDevice= 1.00
>>>>> [  +0.000008] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>>>>> [  +0.000004] usb 4-4: Product: DC-S1M2
>>>>> [  +0.000002] usb 4-4: Manufacturer: Panasonic
>>>>> [  +0.000002] usb 4-4: SerialNumber: 00000Z12FB009251
>>>>> [  +0.019222] usb 4-4: Found UVC 1.10 device DC-S1M2 (04da:2385)
>>>>> [  +5.127335] usb 4-4: Failed to query (GET_INFO) UVC control 2 on unit 2: -110 (exp. 1).
>>>>> [  +5.119884] usb 4-4: Failed to query (GET_INFO) UVC control 2 on unit 1: -110 (exp. 1).
>>>>> [ +10.239937] usb 4-4: UVC non compliance - GET_DEF(PROBE) not supported. Enabling workaround.
>>>>> [  +0.008264] uvcvideo 4-4:1.1: Failed to query (GET_CUR) UVC probe control : -71 (exp. 34).
>>>>> [  +0.000013] uvcvideo 4-4:1.1: Failed to initialize the device (-71).
>>>>> [  +0.000026] uvcvideo 4-4:1.0: probe with driver uvcvideo failed with error -71
>>>>> [  +0.103095] usb 4-4: 3:1: cannot set freq 48000 to ep 0x83
>>>>> [  +0.359825] usb 4-4: 3:1: usb_set_interface failed (-71)
>>>>> [  +0.320056] usb 4-4: 3:1: usb_set_interface failed (-71)
>>>
>>>
> 


