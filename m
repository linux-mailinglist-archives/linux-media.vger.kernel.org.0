Return-Path: <linux-media+bounces-53136-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA5gG++emGnJKAMAu9opvQ
	(envelope-from <linux-media+bounces-53136-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 18:50:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A4C169DBF
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 18:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0CC2300AB37
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 17:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5095C2F363B;
	Fri, 20 Feb 2026 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vk1m1RsD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S1YlsnHl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7781FCFFC
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771609819; cv=none; b=ngVb4Q8mQi44h0aruSVNLbJ8u3LJHdpy3B7rmREuB+Skb5BZx0taNEF9TqqLZEXTlrYWv1qkBdCstPQFuNxdEVptyQprnpTelmvXLtt/2agMcMp9P6BDMMvQZS01/YZkkrDpn5b8bDnQWSlkf7AcQUiri1LrOweGg2wcH7yITsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771609819; c=relaxed/simple;
	bh=D//mN3YPifY3cl8PLRDP53+h2JhgVIFfjhhiXTTPRDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H0h4BGz0wk2R9jY8JhZcAN7shED0h2S7j0awd82zEs6ZFacNISzaFITZ3suGGUE68jiDVBdwFtiuSr9nJen2wjozKtw0CA6JgPVNXY8LNhL6qLanWC1CZJjz3g9brI0lmTrJbsRBd7Rn2KpWki+WeBrIiFF3EIx+3WZXYrSsIqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vk1m1RsD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S1YlsnHl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61KA3roU2218824
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 17:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mCtlEM2Vm+Qig2hWyYhE8wvOL+NVMHeYuWc
	s17dbnrk=; b=Vk1m1RsDx9RTZoYmS7e0iijT+7BiWJ65o5nh6Q1Xq3GW4si/Uum
	5bu2UuvA8Fxyd2j0m2MqkZ6CyrDHdMx5hMp/vH9+QDtVNq6itF/AYAMNGVRGa9qx
	bYtdqtznR3YHMf1pVjawBJKTE3lbpepoAOgONFfXfL6M3QoYAAnrRunPA7PA4TKz
	pjxv/xo3CrPz5DIdF+VZpEIU7b768Pq2E6BpkzNgQuev9wqaySVGoFTIHe3XFT2m
	SkyIQTNW2iv+1e4rAru9ROz6e5JahLNws9cNH6L5fqPDL3dS6ek9+067au6JENrP
	AQSVPEHTs4FpDiUpwLHeR5OF1AmnZnxzWqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cenhgs77g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 17:50:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b6b37d8so1747078085a.3
        for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 09:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771609817; x=1772214617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCtlEM2Vm+Qig2hWyYhE8wvOL+NVMHeYuWcs17dbnrk=;
        b=S1YlsnHlR6Fd9WzVxoqnqA3qkAwJoDYKHSB9GlbfePZRTapVwORUxU4BKRaY4ptmrR
         fB5o3l2mbB/qMtmQdG65RIC2hn2rQZpikGIDO5amesJJv8AJV9jojuck0CoqoHoU+Sev
         cfJMrzHYAQcvOLzmyFjYolgHkiG7qfn/dsF2ROsLGbR8GVf0JaXE/B0GsvvVdBTA1sFq
         4Se4XC5Pc3k/uPYvDZwS9m//pgrrM3NUYIGLxcXPUX0y4AH1R7HUvZ2jZtTDLeu3sUFr
         tZ0JtPNyVmS+UhynwF8ZX17qi6ZcfXPUQM3t4FVk+CQ38wu8aiFWdDNsNmJaD/rxRJSq
         a6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771609817; x=1772214617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCtlEM2Vm+Qig2hWyYhE8wvOL+NVMHeYuWcs17dbnrk=;
        b=RobwIpql1XFJrUdg/9FuEtJdA5fegGiMDN4OLRHp+QgruV1RsyZqCKyGvzhldHdOp0
         PcImnRPxeX8RHkUZa8C1yt876KEjV5h9dFeQLvEmUMoyJSSU7l/nDym2qTMJ9Jon3Evj
         ZMpNy9YnZIaNzSaD4ZU50LQ6hDiFZMoePBHJwE0FDMTf1NrgTrjNnPbdjm4P9pxi5n7a
         GA2dCkVhqqJXFLnhFwYvwv3rEHnfAa9hk0l3egHXbqzKrnbjbSIOfYUDckn7EjULfwB7
         zhH7hsaf5WI3/8fMwjD63AYg/rYlV/C22SjT9DMrGMaLWgMZA/LxcyJZCGZjhDueXMcv
         X1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX8qMHzmd7tVOFfNCJXnaipPMjowRb5ToKJF3Ttb5D/Izs77U2EeoRfrpgr4LSmWNNkzigUzlX25zMQUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwqKMKfVq9jxFP6r7Vz1EsronUEMcBRa2vfJcwL65MJT38wBNd
	Qd1Ap753DnUb9JY4PtVYrj6NhmoiByUUG7VFQNB+aIsC4z+ynmgjrbmn85LxBrSYxQcWpXyZMez
	juH6gU6sfOf1lncf4ISXmSOEmvOuzl4LfbnrbTA9GkFAijQcHM3C8xKbodHrmyR9urQ==
X-Gm-Gg: AZuq6aK5MMRqS0s9lXRJHQJsDxI6bqJ4Hb8uaAxWK13a4hOQnnPeKUirLoPSmDBRFU1
	TjNU7u8Ev3ZBb5AGn+Fo3jm4zv9jQXWQHLXEqBHha74u85SbPpJvJBTokvWX45Lomng5D9BTirn
	q8QZlZumO8UJ6FpkGhMX4fzCCGlhvl8jvKmRaRXhDz7/ZYju8V4yox5b6J0WVEYg3vQltzZUPBr
	S4QGtrBHgOH51SSMfhYP7c2O/+tEKlTC03X68NTzJe2YDWSJgxz9I7X8cI6Y/qqlYXcpS51DwrL
	mLAWNwJ+w6vCQuY+Z/xsySGQINH5O4NdhVgi7LFu/+A6y/NE5V8zCOOotk/cfM8vPjsJw1Pppzi
	e1400gl5AN0v5eaQZW5w96gpRh81YtWoSz7dZPQ==
X-Received: by 2002:a05:620a:414d:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cb8ca92dbdmr44700885a.72.1771609817011;
        Fri, 20 Feb 2026 09:50:17 -0800 (PST)
X-Received: by 2002:a05:620a:414d:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cb8ca92dbdmr44697885a.72.1771609816492;
        Fri, 20 Feb 2026 09:50:16 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm59802502f8f.26.2026.02.20.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 09:50:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Igor M. Liplianin" <liplianin@me.by>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] media: pci: dm1105: Free allocated workqueue
Date: Fri, 20 Feb 2026 18:50:14 +0100
Message-ID: <20260220175013.673021-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=D//mN3YPifY3cl8PLRDP53+h2JhgVIFfjhhiXTTPRDE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpmJ7VXTcvpa4npykgxv/1DAbF4SP5nxSo55QqN
 KW5555ok12JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZie1QAKCRDBN2bmhouD
 151+D/0V5JIhMVM2LVUZ4HOPtgzj7glEdGhbkDTsXe3nMxHacBo+G3w2Mu1VyQNqci4Yc4zVc6B
 6Ktohr0QoczJdx1nv13UcYFd/je8bevd3wkZH2pAE5LRDshGooEvqqQ7UCwW0bAXHx5N96XSfd3
 ++HOt9uMsPu9WaWv/0JlQBoyDd+MlqDqteaveyed5H1jy6jX+AgBnFDNB5ZKSQZSCe6SfKIQWs1
 EkWbufUc3hLorG10C5RQyBkkm8uYl/xzpkspZ8sH0ksuirkQ7zLEJol2lWPeP9GEEysZO7LYQTP
 zNXygTyZQlQJgadXJri4UYyedgHAqAXs1JrVtJ1CaMzsRm5k0cKSk9LvH+MbF1tx0HrqROqGObC
 PWairB5KGcteS08k6M2s4qd87l3aqnzG5F++3qJcq+aqzzVSQ3/3wD5M2UoEP8ushepRtmItL8q
 candns6aeOer6vb35xXcA9V3BQsEtSQDDtwWXkZ37CWVCMSZc7inotuCQlMBu0A+naB/hVXSozb
 UPXOTsRvuVp68tdETQy814+VM5E8m2Ntil6MXCvCvV5HB1tyk/z9Cy6y+DzUTJdXiFUcWfKvwkg
 FcNveFPXGFQqBngAcY8Qbe4cvQQ6kbmJAU6dz/f//DjcUJiSBF8ei9P9dYkh32kT9e/0cJ7WAg+ k/EQYrgZPMVdpTQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TJVIilla c=1 sm=1 tr=0 ts=69989ed9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LExpPkxNjxu_IcRyS8EA:9 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sKpmh_VIHRonXLKoJq9El9Ak9dXuOUPU
X-Proofpoint-GUID: sKpmh_VIHRonXLKoJq9El9Ak9dXuOUPU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDE1MiBTYWx0ZWRfXzoNqT8EPurL5
 TrPCJ2gkvIcDy6bq39mnBKmTqWZrysZ+h+QjqsOnry6F4hObLw6nwtgecbLUAw2OSH5iwH5G2j5
 3d1YOCLudAyZZFcConClYrSpTSy54sPYc7goSe6EoUiS19c6ofdMNAZ/sVW6No8EODdXchZG61V
 gjFONNSBiPagRX/N8vKljwTE01G1mpUuM6fubgCq0DFk6738PkZMTh+FArqG4mKLcG+2Sr5PNNs
 pUYX7hB4ngm6GkMpE/KkZ0J4qQ03MQc8o1TFqBb3pol2ELVI32goA6rfjEsRdp/Sc+dtJwSeJR7
 KzKMcDqyDsPsgef22vY99B8UbDbHajFqXq37geCvcaM13CvfgKJZkJNAczFngktZDC7hHOHFe6P
 cKbwf4KkPpgSL8E30X7XshHT9FF2N/a1N//ntaITPxJM3CjeDmF+9eh8v1AxlBUKhbIcix+cfed
 xkv2ab4ikNt+EAA/Yxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_02,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53136-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 15A4C169DBF
X-Rspamd-Action: no action

Destroy allocated workqueue in remove() callback to free its resources,
thus fixing memory leak.

Fixes: 519a4bdcf822 ("V4L/DVB (11984): Add support for yet another SDMC DM1105 based DVB-S card.")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/media/pci/dm1105/dm1105.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/dm1105/dm1105.c b/drivers/media/pci/dm1105/dm1105.c
index 9e9c7c071acc..57f7e4df41b2 100644
--- a/drivers/media/pci/dm1105/dm1105.c
+++ b/drivers/media/pci/dm1105/dm1105.c
@@ -1193,6 +1193,7 @@ static void dm1105_remove(struct pci_dev *pdev)
 
 	dm1105_hw_exit(dev);
 	free_irq(pdev->irq, dev);
+	destroy_workqueue(dev->wq);
 	pci_iounmap(pdev, dev->io_mem);
 	pci_release_regions(pdev);
 	pci_disable_device(pdev);
-- 
2.51.0


