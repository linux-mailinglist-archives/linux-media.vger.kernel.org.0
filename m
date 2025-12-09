Return-Path: <linux-media+bounces-48478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB5CCB0823
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 17:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73B5C30FC0C9
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 16:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02B63009D3;
	Tue,  9 Dec 2025 16:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHNPKuxZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZYn5+lz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06052D0C66
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765296389; cv=none; b=E38Fbjav85HoWSice4ihAdF44R/ctG7wey39monjAs9ikUS95Bt9+PS3iM05c3E4yCu0qjB+ei7QsqzAymhFh6K7FYIvk8VnKYayy6HOAOJcn4ZUY14U9mxtL2ibKJN8hVH3cjAX3ae+Swbj8GY8Qz8bPHS9GTpd3e59Xyh4zE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765296389; c=relaxed/simple;
	bh=ONzgzYH/miAFCEJscBT6mQAHabr5g4owlxPIQa67lqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P3EVIOqdB0CoDjbh3x9cCLPVApq6ASMwDljDhJSy0dnzuLrG8dQDN61PIhi4bK4+p6vXkD9ITg0xt/U1UqJVU8WgXCmz56m3FoGzGtqw4cdCVTK2LWGRmYzheTHGM9dDWZUa4sjOXV0109l60DWuB/M4KKXEHbq95CK6khPdMm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHNPKuxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZYn5+lz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9G1Cwd4160295
	for <linux-media@vger.kernel.org>; Tue, 9 Dec 2025 16:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rOo4s5XJ3nomNiD4/eDQrl
	wkalGwIGNN7esoHt62xnE=; b=VHNPKuxZ8PLOFHvmVEaPCmFmwqQaWBnl1Z62ZQ
	GwmciAZ7Szn18AD3uKUxG07t8U1svNhy8dnFEv9yV+EVDqr23TcKv/ZhJGUpsPi4
	d1VGV4X9ciVc+AmcWcYVkyEIzhcDWVwCkY8azxy8t8nj405AXrAiOgYDw3taVtEy
	ZV358E5JIeB0V2BsSYBskDW/wn2o37E+4Gkb8YvGFEl4bBstRXE+hTQNKcNgcAfl
	PTHZv6abwVluob6NYbxTWWNF5ztCyjWaiKNWq2AGRRxBtlH5/F4clF8hjq9/kYPT
	4jwMOa6LcLvzAe8wmKxeW+dIZWcGuavdWCCf+QpCUIdgwhiw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axpx180y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 16:06:26 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55fc6725c86so1009714e0c.3
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 08:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765296386; x=1765901186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rOo4s5XJ3nomNiD4/eDQrlwkalGwIGNN7esoHt62xnE=;
        b=LZYn5+lzGB1HKRFpRlCIw8s8WO5Lz9M2us8eCVYe3/3qezjhHjN4XwrfqbToA+LCDO
         p1o3fSz/FWV56oe76eUU60JBjaz4DMCR12te0K9Q7UUHU8P79HvYgLX4e2fDBGDPqVaq
         3Vy27zmhHFrdGoE/X+jWH60JzScIDBnQM4mlf/tnxE8Dy5jNmhOnPAOr0q7LP3F5Q/V9
         Q0NfdozYPi+zdZa3sdnXB7tkt7HoMCCYThEOmbARyQ1VeFd/48/DSQFt3eDoUSp03I7O
         lVQzgWd9pzy2Hq15XtTIIuOssLTcZZADMXcHlBuPjXdzBGYJHaXcbxf8xKrw1GuF6MX2
         0ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765296386; x=1765901186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOo4s5XJ3nomNiD4/eDQrlwkalGwIGNN7esoHt62xnE=;
        b=IMcl6NIdQwIsc1DQfAeg7GdJxR1qvnJofsXsJMRfhZvSm5elqXH8hBR8hAXcHZWhRk
         HWUGyTZDJ4SDoJ3jOWWogakW4C7wE/dNMNPOdb4720hjzipCDpkqNlDx4zFWdKiB545l
         cfDmj5wmnrpctvge2MfkuzP3Tyb3Xqlno13fqgaQXVAkFTwHIhlXvd0qh0T97yDDqeXN
         talD7j70uTGLR9eAnK02WQV220FYdRlUBDAIYHeCOgZJlCIaeDHkUQDS05feQt4aJlTF
         iiePkVVdlkCYlO53qX0Xn9JpqIC39CGOZUBokTHhhNSBJDS8z83YAkIYWYIAU1b9fVta
         Ns1A==
X-Forwarded-Encrypted: i=1; AJvYcCVAQAyarKWKcG016c71COcrRsUpOihmeFViWnQwilVkrTTbL5AT9ltgMSyb8zLXT2iA67eq9vNP8zbwSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwITNIET432UqkRdMvlLTrd0YMLnNtI1lry1rFK8s3APTtJzuon
	oCit3/zAk0I7YYo8YyRWCUAx87JxK+GANdWJwh4R5WRUIEYFlUEyiIyXn9qKu1S9KnyNrUFXcYv
	HbOKD2G4D4+mcVmVOTud69agyF/T+YMO4p/7QU3VGQuakA5EaOVedecnX9E4ppUe/kQ==
X-Gm-Gg: ASbGncvAWK0w7pkkKg4uXkZHWXuefTWnYFNN2b0VjEjn7o1KQkMN9Gta0UUt5lsxI1x
	fHQRcjeswZOgLkokjFg3RF0flP4IRkFBAmIS0cJU3NXDE1I8/dPhzE6Xe66Tls7VOjWUcczL5iq
	NeGYepzQR/uZbPImmp81t2MhFQC8s6S76otsb7n0zpmhl6OB9l8VCaS05WnoOgPXTRdKE2ZqxxT
	JOrpUPqHs8p6ZaQh2KjBH1RF60kHh44C+PRYJgTNmMNCJM+375W9EK5nvJRdBK0f6pUqT3/YwAY
	YlIwER4moC+IPkDhNbpigH2EcyDUc5VsNqAoOCzSobt1lh3acpwMdGmgCSigr3aUNrfJfi76aEE
	+8pVghng58Uyy7I0KmcfBV1Sz3z0kyLBkcIdqUOmyN7/MSuxkw+AVok8rXC2aKMV51jSUq4EAu/
	mVbBd2N4MGwsjyq4XK6PVzWUecFNVbwMfxb5qcQWRuc/ej6w==
X-Received: by 2002:a05:6122:d27:b0:559:f0a2:4aa1 with SMTP id 71dfb90a1353d-55e84710613mr3815265e0c.12.1765296385566;
        Tue, 09 Dec 2025 08:06:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYh2MVMWhuIqdQFthO4OcIHHVfBb7+A/Z2LHJf2xYV+VjZr0ktS2TCtOAC/6s+itvUBpQJ2w==
X-Received: by 2002:a05:6122:d27:b0:559:f0a2:4aa1 with SMTP id 71dfb90a1353d-55e84710613mr3815010e0c.12.1765296383703;
        Tue, 09 Dec 2025 08:06:23 -0800 (PST)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b3599050sm14324838a12.17.2025.12.09.08.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:06:22 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH regression fixes for 6.19 0/5] media: ov02c10: h/vflip fixes
Date: Tue,  9 Dec 2025 17:06:16 +0100
Message-ID: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pEPnfpP9gX70L4qBB2FaKUHoq6rARCed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEyMCBTYWx0ZWRfX4miJZnRI5AIH
 tULF2difIbxK0xqDdZWK+MT23I3d+EZ7Y/rrn5ej6WxjR5eRilRJQ7d7nPtcAwfEFomYeRU8fpP
 CGS763gYigWPYnzbBgHR5ZewB54Lhk7ZNwYKvGqmQWfRftMICk8T2jP/Cn+lb1C7a2MX0gnhtmF
 3oe7WksSa+owjUNRY302Qqa/QmmaH1LVee+Y9qIyACYLSeg83gmVsPfa8DVCDkGk7PlLgTQw947
 qTMhdpWQZGnM3uCMPcuKYj6TFXaYt+lpd9+EAipbLFMjxGXN0Mwx/j/txTh54zxo3TKgnI0ddM/
 bcq75ZMLHzpntWellMP7bwDF4qIZi3mXYnLIDSCg2YxwSqDBycOlbAJvu+Do7J5OKh3MWUJlivF
 /q6k9qY17Bsig2WXMB7f7H3Fp5SOSQ==
X-Proofpoint-GUID: pEPnfpP9gX70L4qBB2FaKUHoq6rARCed
X-Authority-Analysis: v=2.4 cv=Su6dKfO0 c=1 sm=1 tr=0 ts=69384902 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VFhOKFnpEkSlfxSC7dUA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090120

Hi All,

Commit 69fe27173396 ("media: ov02c10: Fix default vertical flip") which
has been merged this merge window is causing various problems for
laptops with a ov02c10 sensors:

1. This changes the vflip default but does not update the bayer-order
   leading to debayer artifacts and wrong colors

2. The ov02c10 driver was originally developed on a XPS 16 9640 which
   has its sensor upside down. Changing the vflip (and hflip) default
   values fixes the image being upside down on other laptops, but will
   cause a regression on Dell XPS models causing the image to be upside
   down there.

3. The mentioned commit only changes vflip, so the image now is upside-up,
   but it is still mirrored.

Patches 1-4 of this series fixes these issues. Patch 5 is a follow-up
cleanup patch.

Hans Verkuil, can you please queue these up as fixes for 6.19?

Regards,

Hans


Hans de Goede (5):
  media: ov02c10: Fix bayer-pattern change after default vflip change
  media: ov02c10: Adjust x-win/y-win when changing flipping to preserve
    bayer-pattern
  media: ov02c10: Fix the horizontal flip control
  media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down
    sensors
  media: ov02c10: Remove unnecessary hflip and vflip pointers

 drivers/media/i2c/ov02c10.c          | 28 +++++++++++----------------
 drivers/media/pci/intel/ipu-bridge.c | 29 ++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 17 deletions(-)

-- 
2.52.0


