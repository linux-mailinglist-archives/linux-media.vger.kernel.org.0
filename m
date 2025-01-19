Return-Path: <linux-media+bounces-24911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFD7A162F4
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 17:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A5751885ADB
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 16:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2E91DF74B;
	Sun, 19 Jan 2025 16:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=littlefighter19@web.de header.b="mG4cWoNU"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4896E3F9D2
	for <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 16:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737304471; cv=none; b=ktpI/X6fDxqaXfJ+rlhAqXIl/Q+a9k+Yb1lFyIwZU+SW00Ua4tu5CEZtMTWlFNn00HOFtg5Q5sCsrIhKNyIbmbTHK3Ra2XY0bvA5Gqme2Z7eHi/prT5YMC7VFf8M+9gj2CbOvBhRmYWI3IcyNOgmOEuZc2th+A05khvwpoDwqcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737304471; c=relaxed/simple;
	bh=bkDUzLm9J7d5oD0oJxWWATTflLNLDsca5ko9sX9yrpw=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:From:Subject; b=CN9kixhNN7IYh5lTlEBJuctYhhsBDrKHECArXA7q4kxe+F56tS8c9esuLcod2qaCTxgvykkhsw9vppZHM8cD6QgurrEpZIFm7W4rmuDN7EGeYtlpELTFzrcfKqR/k/yaPHfJFQWdPstef47DvDfn5yD3gkFa1vQUZCOYsRiX9fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=littlefighter19@web.de header.b=mG4cWoNU; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1737304459; x=1737909259; i=littlefighter19@web.de;
	bh=bkDUzLm9J7d5oD0oJxWWATTflLNLDsca5ko9sX9yrpw=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:To:
	 From:Subject:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=mG4cWoNUSN0nVIY7pfblHAhPZ6/BEVqhiCf+rcc5Uvwutg8G0Q8Q8W7bFe4rhpv5
	 C34QaVa1V5LztPCJRA3yT/lrGssNsx6Kmya9cLMmUo9JbfXUXLDsrhdSNDG21DDCN
	 RqGbzU2FUus1eGrZT1Ef1Rh07n7U0npEsLGlulYw26ZQLIm27Ug99xgqBXx6QAFtk
	 x9zNgLNwiAVaWADE8IzhrNSyCKEVQv0WFhTtLiItvJgHPXFrcDjiMPqUoLjd2iRQj
	 FjtraRXyK9veudwpb+jbBJbEMFmCDwOuT22JXPXNVjnNTHmS3jbcoyWFy4/nre3Lv
	 aQA/zHaE5r5AqH3kyA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.138] ([178.27.166.126]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N14pE-1tPGdd067W-013VF0 for
 <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 17:34:19 +0100
Content-Type: multipart/mixed; boundary="------------WR1GtZo0N8L812wKkwrUyMpm"
Message-ID: <f609b2e2-2c7f-4fcc-8f55-4b1c1f0e3671@web.de>
Date: Sun, 19 Jan 2025 17:34:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
From: Patrick Zacharias <littlefighter19@web.de>
Subject: mceusb: No keypresses on Formosa Infrared Receiver
X-Provags-ID: V03:K1:NZdF5Rfsx7cr8d3Qajn/Qdkw2KtIFP3noQUNzSnAQH1YZ5v6KCS
 rTHEAZAKRZIJowezAzpvBcpEr1aYVsBoHkTVjsTzFc0ddNOUXtbMSb8E30IC/dUBHFWVVAw
 OuzIrG4vIgF5oVasFclWOyEPS8dMWlXP9w6dEhlNTOLDMLFTYNDBNds81GQuGpaWK12GgA1
 rP4PnZPU8XdwrdUz0cPcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NgHQK901Fpk=;/pU8ZUUMBRCrafR32FRDHAUZthH
 Erpr4p5bXaXjp6nl9ctM2hr8M2WT0LX2efAMkD7eY0rNrIs0+vSCo+HGnLndpHNbtqLMIhiYk
 Lzl/Hw2r3uEgumZ0xN7bD+NG9AMrnv6NNhl2jEHEFbPHOjjipKaiwiKot/ZVt9Byn3GR6vpGN
 T/JefA1KP+nEi1b9OJ7nv83ZeeIm/Nu6sMwdwha4J/g495p2O5sbEZaCAc9bxNepmpurZhWPp
 6DaqDVawNXAzSkW/sLOBcrZXLZfqm4EH7FKP8gIrjYUygI3YKBekUtcxwwvE9WWd5PVpirplV
 e1rPO3MTO0DumzZvl2YDo48sWm415It5P8ONLwTTrW6bTTk7TiBObCa0FLuW2bRUeuTXd/daT
 tFBggnnuT0ueblPTlE3ZsCs0/D+7LOXKeEimkT9jzW0Vt+Ah7D19YR8bSHWRc2CucKv/udv51
 89akTS+OkauzAROjRk1dTlFVzGZC1oAB6pJ1ma9O+vuLDjg2Su9HcN8JbpMZB/pCU/Eg3gdN1
 UjDROeh6/OcNJbh0GHFrUNiW1p3P3LaEwtEv+X61YWOkGSoQ9wqTwQmohsCZ86Q3PlLFsiLp9
 m+Wv9ZGvPL9Ca7eQm+KtW4eNKBzmIC5Hc2irb/cPqJCJreh06GUWZJB5Bk6dGvNxGqKhGTDlM
 HZRvLxSQgX885mx0m2MdQY/tNYwFbL5pRQBi06qfzeCqEKbBQNKusl4F8KWsfQUdUc+8xOAVo
 36WRhlZfnZSXXx+hs4BApjTd1kPFSa6CcCNhbK1AMpUTyLM0478mKb+cX7HEIB0XkHQv2QSR8
 0oLtTytik6KB5lYlBi4sZPwGYnmZlfP953CNleaZFg1l4YfcDDsLJHnaFOOJI0OAh3FsXDKbK
 S76zHJGM8MyoOtuBtWApUsb+1yI7tUQoFDDIYBGPC1jHa6fOFK7vxfEjg/Th5SO4+sWacNLVP
 hRqyrAl+GMRMTC/LFVQ7RfCL4oE4ixIOD9RL8TWWOSAtQkUSImnMeZl7EfBLAF0y/awmVr5VC
 XxjrWZuOyzaE1vKvtp+1DFEpgntnZjM6hhurCyczdvIuaQgqgq3alMeY5udrcT3dKuDm5nz4H
 XqcCn0FDIDkRUNQP0KEaiNZPngkYd+RoLwl38xgg/C9WF4iMhbv19t2mIeQMdv02+fc2jXoOM
 BJcpJT12TKSvOH5S8gNvJicZaAmfGoc+7x9UlE3q8Vg==

This is a multi-part message in MIME format.
--------------WR1GtZo0N8L812wKkwrUyMpm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello there,

while using the Formos Infrared Receiver (147a:e016), I've noticed, that
it won't stop blinking and doesn't register any presses.
This issue appears to have been present since 2019,
according to a thread on a German VDR forum.
And appears to be a regression, as according to that thread it used to
work with their software
(yavdr-0.6.2, which appears to based on kernel 3.13.0).

I've tried this on 5.16-rc2 (mainline on an X86 machine) and with
6.6.62+rpt-rpi-v8 from the latest Raspberry Pi OS.

I've analyzed a PCAP dump from a Windows 7 machine to see where the
initialization differs and noticed,
that an undocumented byte 0xF4 is being sent, after DEVICE_RESUME and
G_REVISION (which are both sent in one packet).

By unbinding the driver, manually sending 0xF4 to the device and
rebinding the driver, I'm able to workaround this issue.
The blinking is gone and keypresses are now received. (Except for the OK
key).

No further testing has been done.

I'm willing to provide PCAP traces, if of interest.

I've attached the userspace C program for the workaround (which requires
libusb-1.0 to build).

Greetings,
Patrick

--------------WR1GtZo0N8L812wKkwrUyMpm
Content-Type: text/x-csrc; charset=UTF-8; name="main.c"
Content-Disposition: attachment; filename="main.c"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPHN5cy9pb2N0bC5oPgojaW5jbHVkZSA8ZXJybm8uaD4KI2luY2x1ZGUgPGZj
bnRsLmg+CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+CiNpbmNsdWRl
IDxzdHJpbmcuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVkZSA8bGludXgvdXNiZGV2
aWNlX2ZzLmg+CiNpbmNsdWRlIDxsaWJ1c2ItMS4wL2xpYnVzYi5oPgoKaW50IG1haW4oaW50
IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKewogICh2b2lkKWFyZ2M7CiAgKHZvaWQpYXJndjsKCiAg
aW50IHJlc3VsdDsKICBsaWJ1c2JfZGV2aWNlX2hhbmRsZSAqaERldmljZSA9IE5VTEw7Cgog
IHVpbnQ4X3QgZGF0YVs2NF0gPSB7MH07CiAgaW50IGJ5dGVzUmVhZCA9IDA7CgogIHJlc3Vs
dCA9IGxpYnVzYl9pbml0KE5VTEwpOwogIGlmIChyZXN1bHQgPCAwKQogIHsKICAgIHByaW50
ZigibGlidXNiIGluaXRpYWxpemF0aW9uIGZhaWxlZDpcbiIpOwogIH0KICBsaWJ1c2Jfc2V0
X29wdGlvbihOVUxMLCBMSUJVU0JfT1BUSU9OX0xPR19MRVZFTCwgTElCVVNCX0xPR19MRVZF
TF9ERUJVRyk7CiAgaERldmljZSA9IGxpYnVzYl9vcGVuX2RldmljZV93aXRoX3ZpZF9waWQo
TlVMTCwgMHgxNDdhLCAweGUwMTYpOwogIHJlc3VsdCA9IGhEZXZpY2UgPyAwIDogLUVJTzsK
CiAgaWYgKHJlc3VsdCA8IDApCiAgewogICAgcHJpbnRmKCJmYWlsZWQgdG8gb3BlbiBkZXZp
Y2U6XG4gZXJyb3I6ICVzIFxuIiwgc3RyZXJyb3IoZXJybm8pKTsgLy8gZmlsZQogICAgcmV0
dXJuIDE7CiAgfQoKICAvLyBVbnJlZ2lzdGVyIGtlcm5lbCBkcml2ZXIKICByZXN1bHQgPSBs
aWJ1c2Jfa2VybmVsX2RyaXZlcl9hY3RpdmUoaERldmljZSwgMCk7CiAgaWYgKHJlc3VsdCA9
PSAxKQogIHsKICAgIHJlc3VsdCA9IGxpYnVzYl9kZXRhY2hfa2VybmVsX2RyaXZlcihoRGV2
aWNlLCAwKTsKICAgIGlmIChyZXN1bHQgPCAwKQogICAgewogICAgICBwcmludGYoImZhaWxl
ZCB0byBkZXRhY2gga2VybmVsIGRyaXZlcjogJXMsIGVycm5vOiAlc1xuIiwgbGlidXNiX2Vy
cm9yX25hbWUocmVzdWx0KSwgc3RyZXJyb3IoZXJybm8pKTsKICAgIH0KICB9CgogIGludCBl
cnIgPSBsaWJ1c2JfY2xhaW1faW50ZXJmYWNlKGhEZXZpY2UsIDApOwoKICBpZiAoZXJyKQog
IHsKICAgIHByaW50ZigiRXJyb3I6ICVzLCBlcnJubzogJXNcbiIsIGxpYnVzYl9lcnJvcl9u
YW1lKGVyciksIHN0cmVycm9yKGVycm5vKSk7CiAgICByZXR1cm4gMTsKICB9CgogIGRhdGFb
MF0gPSAweGY0OwogIHJlc3VsdCA9IGxpYnVzYl9idWxrX3RyYW5zZmVyKGhEZXZpY2UsIExJ
QlVTQl9FTkRQT0lOVF9PVVQgfCAweDAxLCBkYXRhLCAxLCAmYnl0ZXNSZWFkLCAwKTsKCiAg
c2xlZXAoMSk7CgogIHJlc3VsdCA9IGxpYnVzYl9yZWxlYXNlX2ludGVyZmFjZShoRGV2aWNl
LCAwKTsKICBpZiAocmVzdWx0IDwgMCkKICB7CiAgICBwcmludGYoImZhaWxlZCB0byByZWxl
YXNlIGludGVyZmFjZTogJXMsIGVycm5vOiAlc1xuIiwgbGlidXNiX2Vycm9yX25hbWUocmVz
dWx0KSwgc3RyZXJyb3IoZXJybm8pKTsKICB9CgogIC8vIHJlYXR0YWNoIGtlcm5lbCBkcml2
ZXIKICByZXN1bHQgPSBsaWJ1c2JfYXR0YWNoX2tlcm5lbF9kcml2ZXIoaERldmljZSwgMCk7
CiAgaWYgKHJlc3VsdCA8IDApCiAgewogICAgcHJpbnRmKCJmYWlsZWQgdG8gYXR0YWNoIGtl
cm5lbCBkcml2ZXI6ICVzLCBlcnJubzogJXNcbiIsIGxpYnVzYl9lcnJvcl9uYW1lKHJlc3Vs
dCksIHN0cmVycm9yKGVycm5vKSk7CiAgfQoKCiAgbGlidXNiX2Nsb3NlKGhEZXZpY2UpOwog
IGxpYnVzYl9leGl0KE5VTEwpOwogIHByaW50ZigiV29ya2Fyb3VuZCBhcHBsaWVkIHN1Y2Nl
c3NmdWxseVxuIik7Cn0K

--------------WR1GtZo0N8L812wKkwrUyMpm--

