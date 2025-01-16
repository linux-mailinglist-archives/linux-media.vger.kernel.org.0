Return-Path: <linux-media+bounces-24855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E88B5A1443D
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 22:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 342727A34CB
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 21:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5C6234D01;
	Thu, 16 Jan 2025 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="XTdjsoDn"
X-Original-To: linux-media@vger.kernel.org
Received: from mr85p00im-hyfv06011401.me.com (mr85p00im-hyfv06011401.me.com [17.58.23.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD5A14901B
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 21:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.23.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737064432; cv=none; b=k/Iq7BGY04x/vyK6E0snxWf9BkKTC2fzyyOKSOF+NKsO10Y9LvvIlN9vp1UpBgtWB/TZM8HndIU59/gruI4z+CfUNe5GfGb4u6osro7OaM8754F1C+HmK6l9//guz9lJ6g7ec44N0Op5ucLsfmxZwNSZ7+XbUa/vypzLELPqw+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737064432; c=relaxed/simple;
	bh=wFXDl3L0c9T109VFvVuL+RPJWkYbr/AKXuvK4AkDIPU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=GETG1racE9NfoEw43ETHDs30SVRySVTss9xaI9i0jSVQvTjqcagoodDnhZvBdxFelUSWOQyaYcTPpgjfJd05pgNA3coKxMCUDkjJ9PCxfiILv3IafKfR+E4BETiMp8Fd4+d4vhOeZUtbmlQMa+9ermxjKyf+wV/mQHVnSbiMF7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=XTdjsoDn; arc=none smtp.client-ip=17.58.23.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1737064430;
	bh=1hZ4hX7+EthGgK1IFYZZNGg61Puc87JeHnCV+0Wdv2A=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type:
	 x-icloud-hme;
	b=XTdjsoDn4hNXHZBTnBhEwliNQ4ZrqRKB6lIc7KtNqd/rMkrsW3zDctWLy5xhUHhTn
	 WuZMWoBQQcMHQ7glyGKWiyUU92+yiR/K0MNovxTpFS3YexgowNr5sKzWCzEPe1Ib1S
	 p0o4n0tApT8oL3Eiug4PG1D/yOE1No8x2VCU1Hyz0MEi0UNb/8AvvzQrzsw8R+U8fj
	 ykDZXzcu0FX5fe2AvSttt4xWN+kS49hlY4V2cZnx9yzXiP3b+XaUdqQktXznYh88BL
	 ybBkl2Nm8MRckhdlanaXKiPu+or9SEOyhKrYLtQMRu3Fiz5tYLbvZ7YFgciKb8PXVN
	 HJJrgA73bjU+w==
Received: from [10.1.1.110] (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-hyfv06011401.me.com (Postfix) with ESMTPSA id 63D84357AC96
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 21:53:48 +0000 (UTC)
Message-ID: <605529f8-a186-4847-8dc7-65351a08596f@icloud.com>
Date: Fri, 17 Jan 2025 08:53:46 +1100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-media@vger.kernel.org
Content-Language: en-US
From: David Arnold <david.c.arnold@icloud.com>
Subject: Hauppauge quadHD DVB PCIe (new revision?)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f20FYaHQiRw_lkruAMYIXMJJqFX1pRJv
X-Proofpoint-GUID: f20FYaHQiRw_lkruAMYIXMJJqFX1pRJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=968
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2501160162

Hi linux-media people,

I've installed a brand new Hauppauge WinTV-quadHD DVB-T/T2/C PCIe card, 
which is being recognised only as a dualHD.  I suspect it's a new 
revision of the card, as the product number on the label is 178100 LF 
Rev. A416, which is different to the number in the photo of the card in 
the LinuxTV wiki.

Also, 'lspci -v' output contains no reference to the card, but instead 
it is listed by 'lsusb -v' (but only as dualHD).

The machine is running Linux Mint 21.3 Virginia on an Acer MG43M 
motherboard (which has been running mythtv for a few years, with 
external USB tuners).

I followed the installation instructions for Linux on Hauppauge website
https://www.hauppauge.com/pages/support/support_linux.html

The output of a few display commands is below.
I hope you can help work out how to get all 4 tuners running!
Thanks

david@mythserver:~$ uname -a
Linux mythserver 5.15.0-1122405280420-generic 
#2+mediatree+hauppauge-Ubuntu SMP Wed May 29 22:21:00 UTC 2024 x86_64 
x86_64 x86_64 GNU/Linux

david@mythserver:~$ sudo lspci -v |grep -i wintv
david@mythserver:~$ sudo lspci -v |grep -i haupp
david@mythserver:~$ sudo lsusb -v |grep -i haupp
Bus 009 Device 003: ID 2040:8265 Hauppauge dualHD
   idVendor           0x2040 Hauppauge
david@mythserver:~$

david@mythserver:~$ dmesg |grep -i quad
david@mythserver:~$ dmesg |grep -i dual
[    2.912753] usb 9-2: Product: dualHD
[   15.918553] em28xx 9-2:1.0: New device HCW dualHD @ 480 Mbps 
(2040:8265, interface 0, class 0)
[   17.252253] em28xx 9-2:1.0: Identified as Hauppauge WinTV-dualHD DVB 
(card=99)
[   17.254719] em28xx 9-2:1.0: We currently don't support analog TV or 
stream capture on dual tuners.
[   18.608243] em28xx 9-2:1.0: Identified as Hauppauge WinTV-dualHD DVB 
(card=99)
[   19.960477] rc rc1: Hauppauge WinTV-dualHD DVB as 
/devices/pci0000:00/0000:00:1c.0/0000:02:00.0/usb9/9-2/9-2:1.0/rc/rc1
[   19.960682] input: Hauppauge WinTV-dualHD DVB as 
/devices/pci0000:00/0000:00:1c.0/0000:02:00.0/usb9/9-2/9-2:1.0/rc/rc1/input16


