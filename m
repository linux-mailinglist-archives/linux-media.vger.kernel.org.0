Return-Path: <linux-media+bounces-53157-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COrCE1EXnGmq/gMAu9opvQ
	(envelope-from <linux-media+bounces-53157-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:01:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE58B173661
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8F6F302AC05
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5612034DCF9;
	Mon, 23 Feb 2026 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUNbRl25";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxVJrICs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A0C34DB44
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 08:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837198; cv=none; b=ELoBd3+ZdQJqKqs54FRwrSCbVseLqxMb4pUolTVqTnLRk05nuBDcbBzvU2sublSNxZYt3kAPFjWJgPIYbBNGkWCVacJP0j9iXaIGaU/5hGSIVloJkCd9Vegfqtbh0DiFztCrmYEbWLYSc4p28g3KuF17HDAqYciMXAxhVlU5CSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837198; c=relaxed/simple;
	bh=VvG7vd7fZWSAXv6PdVUXds74cvD+b0T6Unx7PuBmRnc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=og5z6m/6hO3hGGuv0lGSEkh9fHSvUHL+Yxsir3FJttX5wImhjZBCh2GtSkT7YLEtibGuKZNC8PPYY2ouYHP1DbhOQEfCBBSH/ENXt8exE9cZA622w+Ql/QVV52M06uQ/0/T12V8fYRGCvivaROO3FCzJtuD6rRO2NS5xSY4Obys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUNbRl25; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxVJrICs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNv7wo3173494
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 08:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vu5+kJ2KRuf7XSsncM4pNa
	9NRUl8nXTqYbQMD7by2WA=; b=MUNbRl25lBIHci1Gq/e9uHk5NhTxlNl79mdEHB
	1cSDlPuuGnAnkHmC0IHYcUqv+QpAP6GXMi5LcVqoTpoVKq4QwHNHetp2B91OClcS
	zlcvILeVHzqnqdfGlHwT8h3RJKjPNqxArJNPkDmyScBEApiy2yExu4GULqaSjaXw
	Hr9SXir1O/GPsXkzaD1fjEij4E6DQAMibiBnHaH3B5ief0r2ln3o/gj7O0hCIQLX
	bQjClLu8SpDoHswJldsRNcdrxbKnXuOmOkcXgyNToXDEW9wI733h3eHYjgqloHjJ
	1Ax+P6g8Dhiq2A1Ehcf+DcyMqBLeGME2L6w2UT1TZtJhCEig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vj40m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 08:59:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8947c4398c4so546987686d6.3
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 00:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837196; x=1772441996; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vu5+kJ2KRuf7XSsncM4pNa9NRUl8nXTqYbQMD7by2WA=;
        b=RxVJrICsNjRMbb8UbuQ0lMWTFRWatrjaiSMkGeUruBmkYwL8X/HM5pBOhU4R/sAng1
         PJYDhd6sfD64olPfJApm4zEHTHL4PNpTkNznXUumadqf6Wu9rsvrTER/kArDmCUr6CSx
         2+8qPhNP/MCADoJSoW03br6srNT0P4CJHsP1F/THCQAsQwyCrMwloYqrjSQ8YecOdwrx
         X9jeS7sV/csKsoJqaNY543sy2YhKcyk/giob8jjaCXg7z7rTf14y9enRnJlr2k3wYcIQ
         hfkpYoQtqME7Mo3UKd7Pv+rlBYd0PwVI9M+flJWw1XsJ+YoJIOMf9XNBF4Q4+eSboSOf
         iXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837196; x=1772441996;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu5+kJ2KRuf7XSsncM4pNa9NRUl8nXTqYbQMD7by2WA=;
        b=J59w3GQVOYIVs83GahBxCl1al4wbQaYvoItKx+hCDqOBvzzcfVrSFtwu7mfBw7Ujim
         z0H5Heg8k6YxpNQOoubK2t+R9p0vO3JqdgiE/48c9We7dNtN7TgiFreDTggYoDyzkVOR
         KXHdL4lAdh3rZJNJJwxmQW7PhYwE24Itigb8lPoU0AxcDkcJMxPDzwPuSTO5iqYH97Ay
         fe7fd5mLe/xy50p7uTJHK/8bZ6elxJn3mkPGLEyFkgpAvTgoGaqlv9e5LPpyt6HIqtFL
         ba5opCp0B/uEkXV/jyvCAi7pA4B409u3yMVVuvAkKvUzJPSz9MqXwBGo7D8mbXJ7APMW
         WiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXiFTMPOSkfbt9kA8T4akE46MgE2MZvX2m5kyKOEz+IoGFyI6PWwqACFA8wsbaTT7L+7sRYiHb3+aauQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu56VMzY9samjRU5X5BW3XcC0l7bBCjp9mzEQbByApvHa50Euy
	Tk/wW9TmCQaFu2Kgo2D3K6nKDFFjyWSxE9yQ5QzL/3WI01sQXqf82qYc7s2+VwoAwnBsMiqBupr
	1gPBzFIzMtCGSJy5d9mirbyjpt7J2dicoXSbtFL/GDId2RZsuZRn0kc9uZXsBeDDHVg==
X-Gm-Gg: AZuq6aJIdoVHITd/WIOcVErr+fTGYxoMTXtjaxY++fBdQwsjIM+ZfF9ei+PArAxcCWL
	UGk2POV3g3fvpkFwdj1Z6Rk+bL3IwDTHShcUfJfJ0HQwf++e8/PpbV7JvzRAmIXy98T1xaC2SAL
	m+sDYuNHqQ7A7S0qcb+JWQ4LiEgOOX132qMzlyryjRU/W5lBjCf7q8ALb4euIH9FTL0rqpyapHr
	RIlkmuEZzKXH+n8ihPKHcg2ylPxgKll8x5ed8hAD5MOATTA4wbId/aaleQ9gGc6zyrqrbXUMfte
	HPHxafbKspaOlUwqfiRqrg0CdLCWrqAqV+6CzjgL0ISngyjgkgMbsv4+qjku5ljXMtJD+B9JRbJ
	2FHf0pUOP0rxFfUBrvGjX9VL5t4T15jGdiuAahDNn8wh3abtSq9Bi
X-Received: by 2002:a05:620a:4416:b0:8b2:1ee9:dcfb with SMTP id af79cd13be357-8cb8c9cdeeemr899729585a.8.1771837195588;
        Mon, 23 Feb 2026 00:59:55 -0800 (PST)
X-Received: by 2002:a05:620a:4416:b0:8b2:1ee9:dcfb with SMTP id af79cd13be357-8cb8c9cdeeemr899726685a.8.1771837194998;
        Mon, 23 Feb 2026 00:59:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.00.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:59:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Date: Mon, 23 Feb 2026 09:59:29 +0100
Message-Id: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPIWnGkC/22NSw6CQBBEr0J6bZOhQfysvIdhMY6NdAQGp5FoC
 Hd3JHHnppJXSb2aQTkIKxyTGQJPouL7CLRJwDW2vzHKNTKQoW1GRCjkcAjSj3dsuB04KNryUBe
 FyZ3dGYjDIXAtr1V6riI3oqMP7/Vjyr7tT5f/000ZGixKa/a5KW19vZy8avp42tb5rktjQLUsy
 we7dqc7uwAAAA==
X-Change-ID: 20251222-i2c-printk-helpers-a69f4403ca70
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3499;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VvG7vd7fZWSAXv6PdVUXds74cvD+b0T6Unx7PuBmRnc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBb3fG3CwNJ5M/hqqSYT43XI8trsoU1YEeWt3
 Kxjocc+Vx+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwW9wAKCRAFnS7L/zaE
 wxkpD/9RhvfJv3ttEDXAr5ioS+xTqbBT/5fiaxaSwFIZeJ2gZR91bPruhA+1jSyV0rb7iB3dp1x
 hnZGjJ9fxV1Fy4Vhf9la6j6kbkt2byhBaua8B1h27CzDQZxi9LLUHYTUH/AegRw5GVtSv8dmybn
 daYh1LYZItCUKjucKFGeNH3zJMeWpnpa9qhYjq6AWFWCf68SetWMt7/lFDnG10eh5NAcMjT2H3m
 EoAu/D7sLQ8ADCiFNVux65KSZZ2jMTuDOWQ2haWCJjWO+1bNrNtFn7Pb7aAivIWnLRfck9mmH6i
 EgXwBu+yuO0s3JIDAvdDr0iCt4J0xkXCidF15elPYth67L1H1GwbsMStuSvY4t/jryayd8jY/x0
 Ruab1IgXtRrRFwfIWjsjTXkTkXMKKE0IgtIquSB2KQMHQFpEF7HGCilnjRVAT19GvwLVaYHWMh6
 VG24DSSR+aen7xI/S23yArfiEaEBiIPn8s54a0BCIkKQdWQ177nIgKDDS20LekvqZFwQoZeqC00
 bJ/VAJrP6jOqL0pKu+2XLbv3Em2SMjZ8VXGMKj6Y4NKkmDmE9B+V00GpZM/S/nuwfStzjF1+nqj
 gGn8Hon0035YW5EZRHQvYVWhqQxv6ThLBvqaN2lA60105wjKRVxQ3cl5rvHVmwmTgCjqSjzhTIO
 KwabIv/iYhBFs+g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX7EhEniUT9How
 +ESXoQUd/aI/0cuEh27KYAY22FPlPv9zJLxKp8+3lnD8ClP9R0DpksvT85x7F3QuUsMoDAfoKcY
 mTPpzTu9Hps9oDbEgmbeIWDci7ldJUz0VdK9mCrJfAhRs1av3oUYr3S+/YWqQxMogtIG19YUnC6
 UQbd7IcbtvjpOmiex3C3S8YXeFubdB69bPO7Yyjp27jaryB1/JLG/7EznurW2VsnjbNQz68eGvT
 CCj47i3U1bbl51R/yTMGcpi5GysiHbSygKZPXS3KRPWXSWXFaIBoEjojiJnjcgI/NvohrdW+4Dq
 b2NtpgiXbA7xTtFCbsHskClKHuFO7mTAacxIT4XCG/xlTBBXsvmz9L96IyUOBD38/r24n6dHfZA
 r6Um7TEM/zKE/JsEh7Hyy6PjO+NNC1Di1PZF4XlnOpwHcR6XjzMrIyRcPTMvF9mRcuN7Yxk2ldn
 k77x1RwK3rR/kQLnW8Q==
X-Authority-Analysis: v=2.4 cv=T5KBjvKQ c=1 sm=1 tr=0 ts=699c170c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M7r7wYDzB2Ki_6CY1cMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Lp-hLcd8vTuL8m6yf9mmJ0nPhe-D2Cx4
X-Proofpoint-ORIG-GUID: Lp-hLcd8vTuL8m6yf9mmJ0nPhe-D2Cx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53157-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE58B173661
X-Rspamd-Action: no action

It's been another year of discussing the object life-time problems at
conferences. I2C is one of the offenders and its problems are more
complex than those of some other subsystems. It seems the revocable[1]
API may make its way into the kernel this year but even with it in
place, I2C won't be able to use it as there's currently nothing to
*revoke*. The struct device is embedded within the i2c_adapter struct
whose lifetime is tied to the provider device being bound to its driver.

Fixing this won't be fast and easy but nothing's going to happen if we
don't start chipping away at it. The ultimate goal in order to be able
to use an SRCU-based solution (revocable or otherwise) is to convert the
embedded struct device in struct i2c_adapter into an __rcu pointer that
can be *revoked*. To that end we need to hide all dereferences of
adap->dev in drivers.

This series addresses the usage of adap->dev in device printk() helpers
(dev_err() et al). It introduces a set of i2c-specific helpers and
starts using them across bus drivers. For now just 12 patches but I'll
keep on doing it if these get accepted. Once these get upstream for
v6.20/7.0, we'll be able to also start converting i2c drivers outside of
drivers/i2c/.

Link: [1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Add a patch renaming an existing i2c_dbg() macro in a media driver
- Link to v1: https://lore.kernel.org/r/20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com

---
Bartosz Golaszewski (13):
      media: saa7134: rename i2c_dbg() to saa7134_i2c_dbg()
      i2c: add i2c_adapter-specific printk helpers
      i2c: sun6i-p2wi: use i2c_adapter-specific printk helpers
      i2c: mlxbf: use i2c_adapter-specific printk helpers
      i2c: isch: use i2c_adapter-specific printk helpers
      i2c: ali1535: use i2c_adapter-specific printk helpers
      i2c: scmi: use i2c_adapter-specific printk helpers
      i2c: ali15x3: use i2c_adapter-specific printk helpers
      i2c: powermac: use i2c_adapter-specific printk helpers
      i2c: owl: use i2c_adapter-specific printk helpers
      i2c: nforce2: use i2c_adapter-specific printk helpers
      i2c: amd756: use i2c_adapter-specific printk helpers
      i2c: piix4: use i2c_adapter-specific printk helpers

 drivers/i2c/busses/i2c-ali1535.c        | 20 ++++++++++----------
 drivers/i2c/busses/i2c-ali15x3.c        | 20 ++++++++++----------
 drivers/i2c/busses/i2c-amd756.c         | 24 ++++++++++++------------
 drivers/i2c/busses/i2c-isch.c           | 32 ++++++++++++++++----------------
 drivers/i2c/busses/i2c-mlxbf.c          | 19 +++++++++----------
 drivers/i2c/busses/i2c-nforce2.c        | 14 +++++++-------
 drivers/i2c/busses/i2c-owl.c            |  4 ++--
 drivers/i2c/busses/i2c-piix4.c          |  8 ++++----
 drivers/i2c/busses/i2c-powermac.c       | 26 +++++++++++++-------------
 drivers/i2c/busses/i2c-scmi.c           |  6 +++---
 drivers/i2c/busses/i2c-sun6i-p2wi.c     |  8 ++++----
 drivers/media/pci/saa7134/saa7134-i2c.c | 26 +++++++++++++-------------
 include/linux/i2c.h                     |  6 ++++++
 13 files changed, 109 insertions(+), 104 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251222-i2c-printk-helpers-a69f4403ca70

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


