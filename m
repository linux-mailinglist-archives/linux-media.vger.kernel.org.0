Return-Path: <linux-media+bounces-49190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DD9CD0706
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA173300EF04
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FB2325492;
	Fri, 19 Dec 2025 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bywy1UeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RWi0agdk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605664A02
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 15:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766156630; cv=none; b=Gq6srcWq+3rO6aNglorEUPOPDoyPlqC1AauHLv3LcfQ4TotzQB93nD5EywfQNVvk7HQz4pioOv5dM2SPf909nILI1IpL+ejlos8jA8lSM1WyFCG72/3HgY46LNaL4g1rnce4HpG8lesxClCNS/2qCh2zHSbUVeCUu6lGhMmorxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766156630; c=relaxed/simple;
	bh=GF+mDnqafj+NDtKSRsIdCtzLrjz1fKdm0XnF2AbCn/c=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=F0Gqrs5CRy+pJ95aDJLbQ0YPr7+9t55C0IX5AH2/jDEe6HD06dPPMkTTd4+ogdEGyi4vOaPK1PA4TDuThMyfqYZ1qfMnnggCKc2msEYDegJtJ5+D6wcvnAmJHXe59ZjfptyCuZZ5hD6xvkyMnT2t8bErdmgJnCaGiAIYVrIXh+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bywy1UeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RWi0agdk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBla373700746
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 15:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RAzFe7ceH7SiZ1+4tzjzad
	Attrr6u/vP7gA9BMLStzg=; b=bywy1UeN4vST9icQyVaZ0VzZCyJA6rsb1TRA0m
	Cyh42ZG6EoVkELeAcW85d3jp2OI9e4zWMwYwaX4TH3BkQtorLkbX/GJHYapXvfti
	WPjdjSOda/uwWWirTvrjeuDLbwhX/2UsyBVXzXDACpHqCnNwA4a6ag4SV7tKTK1E
	Ji4mTezl3ADC9I5L+DM2z+eEbt9Sfny/9twIHnq656RognomMPnqzKevH17hNeX3
	u2ITjwV/OSr7fW2efqBSxoI3ftcdbtfuf/PbwZtHQiNq5tJGx0zuHnZuaNL+DvDY
	GieYX0AP65rMOtbtPIxEb7zg1GzaoysM2By0X5S9zHDCrgwA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ejyk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 15:03:48 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94128f1b13fso3014797241.2
        for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766156627; x=1766761427; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAzFe7ceH7SiZ1+4tzjzadAttrr6u/vP7gA9BMLStzg=;
        b=RWi0agdkXF/efmAoIQlJLj62AxXwV8YqE4PPSrJvU14S+HBINbmUjgWF57rzqQODFX
         Fj6qITOhH3eJdYfBg3OABIt8iKRTEJ3wnKJw992GwXVYp2Gd2R3t61sWUNQ1XFGk7P+p
         IBGms0mF18l/KFFrUbS9O/L/YUj22IbHWIWbY7sydZlpJrelaeWKA/Nkl++FkZ4n3tut
         2bR5+8bam4ABalO4Nbez8SZjpqXCfb0UsdGAlmqcKm5tP3F+ar3hqAU6MwGec80QS4VV
         lqzh5XDje+2imIvq3z6TzrANCHybg2O5YW2iXYG2oW1MU7fApLu2RCCPflj/XG0RPodE
         m4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766156627; x=1766761427;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RAzFe7ceH7SiZ1+4tzjzadAttrr6u/vP7gA9BMLStzg=;
        b=FkbH9VCAQPJ6kvGk168NZhtWu9Ojjb0bpIgH+kv6cfJ1PHgybVomw7R4PzG7UX6z7v
         hqSt3AihTqqR/IF1xdrtgYDsSEuhoNz9zw962y0EykInrC5b8PahwR9I8ZYoJyG8kvFc
         wc0xnCcJW1AUuQdcsGAEFlC7cfEehOGPM0txHJb27sfFZa2DwfJrPhVcIn88iaNt3h51
         cWzzwJjll5bKnAHfMxwpftdHfJIfBv7qn2Yds1NBbJH99+5djDXyLSmMhEVwAr2FZ+bi
         Zl9q9mqvUi8DNxi+VjdNYaHYrjQ4HJbas2RYH0ALqVqsvUs7fe+ki/4UlqKuwgMOHSvO
         a/jw==
X-Gm-Message-State: AOJu0Yz7sr//af0KHAa/J7n/WGp5T1p6EzyQwQa+/1KwOyTMTliMCn9n
	DFodT4vI8C1JBIOk0SURJXbwcQbPYOefuY++DOC8+m3a9liFT0ht2O7geplcPD9KWQI/V6Kt8OG
	CExw4vsgT4tjy0uV9dElPF+psvwKnVkghaGJ62rSuyMRn98kfMisTLyIKudfgj7YZ9VkS0NchOw
	==
X-Gm-Gg: AY/fxX5b3nCeMQGJc0hrKyCqdhX5qNqravhiYgtQTbqenoZOUAPHs+TDxDatENtT3O7
	jvKFeeMfYE//8lHoYmV6GF4HXLv+ftwxeO1njQ3/l4ritdG/A4j/rSkzwnXKzIh+bY2ulVrFT7r
	Y5A7j3FlehgRRshTz3IPe7MHGa5ZzC0drXSRvAX3vamy6Ndy3Rk9FXMGFhC8LGsCkjG1DcnFSRZ
	fuuvg+O7XA79Mjr9+qNa7rzwI5F/M4aV0tEa80pHrj/N/kUFfZEe/5XqHP6NyRtq0LjtWVWyQC/
	3+QVjj6PT76DxGI6wTFHHyu7aCfOd07r2fA3KMT62lWqaUEzKKjAapkqn01QLQIQjVZFfe8UT8n
	saFXmdzXGjIcJd5WE6Brx4+Iq5NVQVHWJd+qanyeFBxg2OQT00pCnFrzPm3LQWwMpi3JfWuOg1M
	AkiYRH6R3PDOAFVZe1EtPa+TUj88le0iTdPrB96h6vZ72pr7HdjHn7MrlldkbfbSa7d/rXq4TRl
	bkI
X-Received: by 2002:a05:6102:dd2:b0:5db:f8aa:3a5f with SMTP id ada2fe7eead31-5eb1a85c32emr1024862137.38.1766156627266;
        Fri, 19 Dec 2025 07:03:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh4TebIOrkcsA3QXvJULeqiXzioqeFjbbjMJtpUqrR7YLdeimyY+en+ABdQmOhVCPNBbECfw==
X-Received: by 2002:a05:6102:dd2:b0:5db:f8aa:3a5f with SMTP id ada2fe7eead31-5eb1a85c32emr1024797137.38.1766156626780;
        Fri, 19 Dec 2025 07:03:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b912534f2sm2413203a12.15.2025.12.19.07.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 07:03:46 -0800 (PST)
Message-ID: <df8059ac-2c6a-46e2-9494-974fc6460184@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 16:03:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [GIT FIXES for v6.19] media: ov02c10: h/vflip fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uvN1kMS3lU2QTSsdLqC6vY3h2etjrOFB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyNiBTYWx0ZWRfXwvy7MOapEyk2
 TTJgn7vN4IY//4L6ZFPbGd+KjVxvqwrzkcvjqED9HdtTasTdfSxvFhOzEr6xzxzhuC73TMNejuc
 Zepf5OdKR+d3HbugPtvBSXqv5gzoFmxTbNq9nKHu5P03khyBgPoCyUimlvJTzStj2YxdzAVRSBU
 CSohaSaLN4ROJatgw3U2fNVGpYMYQ55zuMS1Cz+CIsbjF2HVDKr+m1x2/eu1s0kxt9IIRKA98d9
 56LuU8VUk3fNDCYlLl1soq61UPEdMq4ivgvV4SF+UMTv+FqoAEc1h9MDTYSur+KIYuwemFKN7IW
 /OSnTqR7+GCclvPrOVIm7cSlO7nijIri+sKd/8mEKX3XmyAlIF8SFTXOvmEikaTZGJ/r1wAB4Vd
 GVxrWg5HKeDblBivYs2VGmC0v8tytnBLvJiClgVr1w3vEOeyVI1Z0nCfMEDgFGXrX54zu1JykHQ
 FPInX6CSF1NxKhVTVrQ==
X-Proofpoint-ORIG-GUID: uvN1kMS3lU2QTSsdLqC6vY3h2etjrOFB
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=69456954 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=sRI05BQXzlfy70ZC6g0A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190126

Hi Hans, Mauro,

As discussed in:

https://lore.kernel.org/linux-media/382e2dc1-6552-4ff4-adb2-7e4bfafaefb4@kernel.org/

Here is a pull-request for a set of ov02c10: h/vflip fixes.

Note the tag has a -2 suffix, because for -1 I had accidentally
used a random post v6.19-rc1 commit from Torvald's tree instead
of v6.19-rc1. The -2 tag is correctly based on top of v6.19-rc1.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/ov02c10-fixes-for-6.19-2

for you to fetch changes up to ddf8d8757cb36654cb146f90c4af6a82d0edff25:

  media: ov02c10: Remove unnecessary hflip and vflip pointers (2025-12-19 15:50:49 +0100)

----------------------------------------------------------------
media: ov02c10: h/vflip fixes for 6.19-2

This fixes various problems for laptops with a ov02c10 sensors caused by
commit 69fe27173396 ("media: ov02c10: Fix default vertical flip"):

1. This changes the vflip default but does not update the bayer-order
   leading to debayer artifacts and wrong colors

2. The ov02c10 driver was originally developed on a XPS 16 9640 which
   has its sensor upside down. Changing the vflip (and hflip) default
   values fixes the image being upside down on other laptops, but will
   cause a regression on Dell XPS models causing the image to be upside
   down there.

3. The mentioned commit only changes vflip, so the image now is upside-up,
   but it is still mirrored.

----------------------------------------------------------------
Hans de Goede (5):
      media: ov02c10: Fix bayer-pattern change after default vflip change
      media: ov02c10: Adjust x-win/y-win when changing flipping to preserve bayer-pattern
      media: ov02c10: Fix the horizontal flip control
      media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down sensors
      media: ov02c10: Remove unnecessary hflip and vflip pointers

 drivers/media/i2c/ov02c10.c          | 28 +++++++++++-----------------
 drivers/media/pci/intel/Kconfig      |  2 +-
 drivers/media/pci/intel/ipu-bridge.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 18 deletions(-)

Regards,

Hans




