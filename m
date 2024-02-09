Return-Path: <linux-media+bounces-4940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD58500E9
	for <lists+linux-media@lfdr.de>; Sat, 10 Feb 2024 00:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2A70281AA0
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 23:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BBC38DFB;
	Fri,  9 Feb 2024 23:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sci.fi header.i=@sci.fi header.b="QQedmUfD"
X-Original-To: linux-media@vger.kernel.org
Received: from fgw23-3.mail.saunalahti.fi (fgw23-3.mail.saunalahti.fi [62.142.5.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594FD11CAF
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 23:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707522981; cv=none; b=ZvhZuubuKGaSAwMYaQKMl9wN0z8WwCX261PNdeiimd+r5w7xFxI/XtIlVuF7yr//hOwb7Gptdh8h7kg4kpTQvAfrv+kzsK5WMkABiDErdSFATymnVWC/qaUxB3b4EISoVGeOVt8W7TVg0g3Zx3qlvzgZ0LIVaZG+o3U3EArgDXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707522981; c=relaxed/simple;
	bh=jpXV9JRKkn55NcGEnj1fK6owm572wozYAC2nuuoZdZU=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=MLyiB4f6j0kXP06Py17ZUGKlrWu+rWEHstT7br+xNNR0m7TDMXeU6GOSxTUzsMVcRcVkTKSy6mwa36kpkweE2NJaLGVP/yLX7ihhiEvjGl1+vfeBsW5FaNW/VnA6RDOUp6NxxoBpBqfxn0OofzDlutTv6a7oSVgYCqcQ2SKortQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sci.fi; spf=pass smtp.mailfrom=sci.fi; dkim=pass (2048-bit key) header.d=sci.fi header.i=@sci.fi header.b=QQedmUfD; arc=none smtp.client-ip=62.142.5.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sci.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sci.fi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sci.fi; s=elisa1;
	h=content-transfer-encoding:content-type:mime-version:subject:message-id:to:
	 from:date:from:to:cc:reply-to:subject:date:in-reply-to:references:list-archive:
	 list-subscribe:list-unsubscribe:content-type:content-transfer-encoding:
	 message-id;
	bh=jpXV9JRKkn55NcGEnj1fK6owm572wozYAC2nuuoZdZU=;
	b=QQedmUfD/h9UFN39qlipdaep5APenXdUn7XlLus8oWWtpT4xfZ7Mt71bS6WxX5vh2vEGqIPtjSqrs
	 jMXEkJTE5boyIcbTn963aoFkOx6DJOFQAfLkGaW5/w6ytTMtQUVac2q9G0tgsvFEhfvtnFwAwrC/zx
	 KxYsBD2hDUQVr7/kYklsZQEH5EwBimNcNPVgyw44TQnGKAhtxUs2FHU14z26idC1jO/+XLFicQ5q7S
	 VrGaOWJVpEuia700MEk++DiUUu3eO/MR0sog35UBOI8RtstSDKjQj5C8cA+Naqn9KK90Zfsuw/9Td5
	 P17Sr6ucT733MAJdPrj7KKUD4wo1GBA==
Received: from ip-10-124-27-186.eu-central-1.compute.internal (ec2-3-72-238-96.eu-central-1.compute.amazonaws.com [3.72.238.96])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id cf94a6d2-c7a6-11ee-b972-005056bdfda7;
	Sat, 10 Feb 2024 01:56:15 +0200 (EET)
Date: Sat, 10 Feb 2024 01:56:15 +0200 (EET)
From: ame@sci.fi
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Message-ID: <1132831479.1796439.1707522975527@v2.webmail.elisa.fi>
Subject: usb 2-1.4: dvb_usb_anysee: Unsupported Anysee version. Please
 report to <linux-media@vger.kernel.org>.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev58
X-Originating-Client: open-xchange-appsuite

me@Xeon-E5-2670:~$ uname -a=20
Linux Xeon-E5-2670 6.5.0-17-generic #17-Ubuntu SMP PREEMPT_DYNAMIC Thu Jan =
11 14:01:59 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux=20
ame@Xeon-E5-2670:~$ sudo dmesg -t |grep -Ei "dvb"=20
[sudo] ame-k=C3=A4ytt=C3=A4j=C3=A4n salasana:=20
usb 2-1.4: dvb_usb_v2: found a 'Anysee' in warm state=20
usb 2-1.4: dvb_usb_anysee: firmware version 2.1 hardware id 2=20
usb 2-1.4: dvb_usb_v2: will pass the complete MPEG2 transport stream to the=
 software demuxer=20
dvbdev: DVB: registering new adapter (Anysee)=20
dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.=20
usb 2-1.4: dvb_usb_anysee: Unsupported Anysee version. Please report to <li=
nux-media@vger.kernel.org>.=20
usbcore: registered new interface driver dvb_usb_anysee=20
dvb-usb: found a 'Artec T14BR DVB-T' in warm state.=20
dvb-usb: will pass the complete MPEG2 transport stream to the software demu=
xer.=20
dvbdev: DVB: registering new adapter (Artec T14BR DVB-T)=20
dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.=20
usb 2-1.5: DVB: registering adapter 0 frontend 0 (DiBcom 7000PC)...=20
dvbdev: dvb_create_media_entity: media entity 'DiBcom 7000PC' registered.=
=20
rc rc0: Artec T14BR DVB-T as /devices/pci0000:00/0000:00:1a.0/usb2/2-1/2-1.=
5/rc/rc0=20
input: Artec T14BR DVB-T as /devices/pci0000:00/0000:00:1a.0/usb2/2-1/2-1.5=
/rc/rc0/input8=20
dvb-usb: schedule remote query interval to 50 msecs.=20
dvb-usb: Artec T14BR DVB-T successfully initialized and connected.=20
usbcore: registered new interface driver dvb_usb_dib0700=20
usb 2-1.4: dvb_usb_v2: found a 'Anysee' in warm state=20
usb 2-1.4: dvb_usb_anysee: firmware version 2.1 hardware id 2=20
usb 2-1.4: dvb_usb_v2: will pass the complete MPEG2 transport stream to the=
 software demuxer=20
dvbdev: DVB: registering new adapter (Anysee)=20
dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.=20
usb 2-1.4: dvb_usb_anysee: Unsupported Anysee version. Please report to <li=
nux-media@vger.kernel.org>.=20
dvb-usb: Artec T14BR DVB-T successfully deinitialized and disconnected.=20
dvb-usb: found a 'Artec T14BR DVB-T' in warm state.=20
dvb-usb: will pass the complete MPEG2 transport stream to the software demu=
xer.=20
dvbdev: DVB: registering new adapter (Artec T14BR DVB-T)=20
dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.=20
usb 2-1.5: DVB: registering adapter 0 frontend 0 (DiBcom 7000PC)...=20
dvbdev: dvb_create_media_entity: media entity 'DiBcom 7000PC' registered.=
=20
rc rc0: Artec T14BR DVB-T as /devices/pci0000:00/0000:00:1a.0/usb2/2-1/2-1.=
5/rc/rc0=20
input: Artec T14BR DVB-T as /devices/pci0000:00/0000:00:1a.0/usb2/2-1/2-1.5=
/rc/rc0/input16=20
dvb-usb: schedule remote query interval to 50 msecs.=20
dvb-usb: Artec T14BR DVB-T successfully initialized and connected.=20
usb 2-1.4: dvb_usb_v2: found a 'Anysee' in warm state=20
usb 2-1.4: dvb_usb_anysee: firmware version 2.1 hardware id 2=20
usb 2-1.4: dvb_usb_v2: will pass the complete MPEG2 transport stream to the=
 software demuxer=20
dvbdev: DVB: registering new adapter (Anysee)=20
dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.=20
usb 2-1.4: dvb_usb_anysee: Unsupported Anysee version. Please report to <li=
nux-media@vger.kernel.org>.=20
ame@Xeon-E5-2670:~$

