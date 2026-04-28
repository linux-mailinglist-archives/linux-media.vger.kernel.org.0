Return-Path: <linux-media+bounces-59864-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKioCTfJ8GmfYgEAu9opvQ
	(envelope-from <linux-media+bounces-59864-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:50:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD7D487587
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF749301AA8A
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E2343E9C4;
	Tue, 28 Apr 2026 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="coYLlRjw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQV6Svyk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF25144103A
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777387819; cv=none; b=LOEAJWFcgyhkTrvpTucmo6GBVWpKbbKkdzQrUFhbU6plANCrtwYdNZ53urFVslbml8UVVJnxn+PLDNHjPNcX+j2ajlooSwwnSKU66w0gmjxIDLlMBoHmnbxPxZLUmsflTGZkvwpar53k1CEmT5jstJTZwPtJUFbx0ToQRs1ZImE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777387819; c=relaxed/simple;
	bh=SVWhDf4kcVCdjVPrhFzP6H9j1M1oo0iuBo0Bp/Jbnd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lHB90+fldt8lZpym85vKzZrmyALjSXY4wZul50+3phBdbsBr/rPiVAVun/duKN+vv2ia/CGkYZ1aYV5zV8UApQe1AG57Yzr4fsXMLPqYF/9LuB2P0bSzvjhUOzg/0dVk2kDeoEDgq/F4X2MVmAYP5WRlWhaZPqSGATWKlsvr1Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=coYLlRjw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQV6Svyk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA2rgc984957
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 14:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GsIBwYF3/hB22gmEUX2AWGJXtaU07hGbH8f
	Vy9TATio=; b=coYLlRjw0N1Jzc0VbhuK4ah6yLIuwqsStFKJd6eFVjlcin8MO0r
	fGMUokMnTS3u2Qdtoi5nWQxxbrd8PQeJqtXjeu5A/sVGVKKhCnbJv1v5jXni8cBf
	JVrOiQ+vHUunyTqw5Cqfdz1sGZxQXaoBzVEs8d9IXrYTmnee+pw+C5UxaPe+RI0x
	EXdJk033Qd8y7ZLorJhaoOt4/iNLQEkvLcQ6ABG61fY4af6Llk8Xsbc+2VE2a5ej
	N1sWgjM/K5cY86Hgv8fsuUwMEwZaF4W3HORA2sFGb7JcJHxcf84vPKUQZQk0lUPv
	TwukpfYFmbcYW0WQ0jiZPpHHrAV8nz4yvWA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttt2s60s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 14:50:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-620f5085c37so6129450137.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 07:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777387814; x=1777992614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GsIBwYF3/hB22gmEUX2AWGJXtaU07hGbH8fVy9TATio=;
        b=VQV6SvykIYgtUByj2AG6ZYA0psQki4WT2S+2rXO9o6ofiX22H9HtyR0o7sB1OLxjFt
         UveukhGJ7J9PxgbjIhFnQCZNJ5tt6xm+R+c1LQjk4YlsoiNVorMEBbE4VH0/g8ZMRtzM
         Wyp30ZDm4vZKUTglAxCd0JVqHQBhLb7qOeeQrEJi1C+1iTBeItiCINgZkU5BdvG4I7rJ
         VJw4dEguGgjH08UkXLtnrf8x9yezzxVojDIOIthe4bEVl0HsZJ1EJ5i+R3O01/aPBatR
         RMbsHwvmH8GowNrWHxs6ekYXcsFu9DfAVUaADbj/kGTArlOXA7CUURY7eOVbWCuWu63J
         i84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777387814; x=1777992614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsIBwYF3/hB22gmEUX2AWGJXtaU07hGbH8fVy9TATio=;
        b=BpTMejhBau0mVSJ2WExlArbKodITQJmqc6/KWvgAElfJb6G/OtnHbrt8ulWI689dBe
         12PJxQlDSr94FHFVaiTlN/Nlg/fcteI4fbVDTBwSnDf5t60zqkyZrC22cgWWiQ1ukn9e
         BYOFLQxy0oKGYAjYIVSuile+zAweNxcTfgKJFgU4VfAwFPPtHrQPyryT/WDs+Rs7+LwX
         vuq0KSIPJX4vQC1GcBkCSNB8IcsBJGOtndPDuTw5omQKv7Ukt3aNdgjAfR4Z657NPfjn
         FktqGY0Xhc9QkgaWf6ZBI4udnlQbL/0bth/9UdhXnEFBghYNdDAS+aoMnZ1KN3JC2Mm0
         cSuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2neMfycwMFZN07LPfDeXtkFGSgJor7uBrYYbheC9Ec/iOXPmKvz7375hFe2ZpNt5WRMfZCmxz9T7hUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6Fz0e5xqIBZTLsM9ig+be3Gl5mACTEneZ41oIx857cM7Rlva
	7jmLbNTAOz9l4VIqatQ07h6aHmJlrO9wWjPRJn5nXqCrSz2yJCoia/pAGRy24UCLldsZEdhPPUk
	ncqQPc4i+fBSeJpcU0/WREvzkOzZ+x3GO4/MgFmASr3RI8yz+pSGyrFfA5U56F5B6jQ==
X-Gm-Gg: AeBDietPnEeuFmgTuHY2bK/BjjCbEJ2Q/Fnt++Z79lDSDCOzEhEUV95tB9lvBMpfRZP
	ts77qDUJQarVnxHO7UGpAznbGXJSxZB7osQTepAJce1HXDWjOr3YIg1tmIuTAyGWOknd+l/GDky
	FjCH1nFs+LsC8XjEoTMqa7KcwF6TnyfwUqCZPBVyMZ24sOnrEK8BDVEcZta49JsQwCSUSN7pq56
	ttXwJCYz9cFTkZeA9zT470aYv7HD4q2+3qs0BdVNPdJ8GC95fYtHlPPB4AMhNIsahDmD55H49TD
	Mn+kGftrlDzkAG35TIerWhnh25nILuiZSCvEXnMD45ix157TmxVAnBMAxB0p0xUOZTevRx+elFm
	lkWGgYt7/f9+OafR/5gLGsr4CZ2E8B+hL/y9myEDUBtDmny0=
X-Received: by 2002:a05:6102:950:b0:607:7991:8edd with SMTP id ada2fe7eead31-6280a8c5705mr1632661137.19.1777387814066;
        Tue, 28 Apr 2026 07:50:14 -0700 (PDT)
X-Received: by 2002:a05:6102:950:b0:607:7991:8edd with SMTP id ada2fe7eead31-6280a8c5705mr1632637137.19.1777387813551;
        Tue, 28 Apr 2026 07:50:13 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463ff5a1acsm6761007f8f.33.2026.04.28.07.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:50:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Igor M. Liplianin" <liplianin@me.by>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH RESEND] media: pci: dm1105: Free allocated workqueue
Date: Tue, 28 Apr 2026 16:50:08 +0200
Message-ID: <20260428145007.116837-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=SVWhDf4kcVCdjVPrhFzP6H9j1M1oo0iuBo0Bp/Jbnd8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8MkfIGdfILw66p32MV+z3qAJ6a2bEMshsh9H4
 nBx6uw8PkuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafDJHwAKCRDBN2bmhouD
 1wopD/92AIvFEnYO6sX5M7T6C9D5AQEFBgUUt/YE9uYzCySmQya4+AFf2Tr8kRUCIJ1FYnFlBUa
 y9BfQ0sKxnRTpfl6foN/cr4NuPSf/BmNH44JtUlqUv9HdH4lfJCrFoFJ2Yd9En7bbkvN2VHe+Rd
 IFqZXDKn8q9/XserPLgXapia5IKYR53J+N05HbpJkF0BPSQWzGCSm79DSLvXPv/4rK0NkEhY6hK
 ya13KxlWo9QMIOccP2/+ufAyvvhJisEzrGcnTtokPLpLQxwiHvsjKgN2XEbNjpM50yaQ8dmh7Xh
 HFfABhCrYcKqjndmItGLN8hWAS6qtHUBIK50xSUz+SFGjThCKbsSr8sRexypj7FtYa5vDq864Lz
 4N8bCxwijS35wtgNL5S5xw7CnI35qdcbaT2Yz+9X+bQg4mJPOx3EA0TlClLmJCuJOS9aeC3404+
 FY1YYa07rT/ErTs1/Xl0/kU4XKX5tmVNxBkM66fR0G0LJFzU/hCnJyafP4QVNvJwOjp/XksTs6h
 r2HzTNMGWZOONkkFKivyQDUWYGihC6Cfz1mitzNX+YUEO9JHh5faDCqJ2G4X0/aJeyo2iHsL18l
 D7TXRKzbpsD/g4xDSzrVcmt3UjAKHLm0+I4vWkdBrTOlMiKIGXw7Vp4C7gWJT5LTxXHjsQDduTO 7T8ntuOmkrGETDA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HbIkiCE8 c=1 sm=1 tr=0 ts=69f0c927 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LExpPkxNjxu_IcRyS8EA:9 a=zgiPjhLxNE0A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: nplk88awBZkGQIrfNfSEOcFiLHDuC7IZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE0MCBTYWx0ZWRfX+Em39cSAqgnp
 z4F1JT6WPDYG59U5oV3jWUc+Me2kW+LjE6/3h1NbGsSaTshb/uBgZNgvQxeBto5apmaHy8mzxPv
 Muj6C2znkhu24Lz6t8MylRgmIpZWisB1L2hIiT7ByMjXWpK/lQCHqLL5zOdlFz2fVTm4NrHyjjd
 WX6aDUMDjqaF+7WQWpAnjG5XHfhif2RtIdo6/oDdmyXUeU/LtRygq7FuzrrXc8PVQYRST9iNKqf
 Yirr+InsZ0W3eyRpMClAYaVeesMEtz8jIPAv7UWsgv5hyExdh+zAXIUFkPK1zEBrxEl3eYrQm5U
 e3VeNxFFwDb0EPa2gedNLl/XXMdep0pxQQEb+OLX8vUTBsJzB7nubejkgh34f99uOM9nbfXMga7
 2wNLn6w6433UCic57vKKJ5ZerTsYDS9427ionARJoNZJQYQGhpWvWUeJY0fQjwUBP6dP6V07oup
 AgYizcJ0sv5tEuCPmTw==
X-Proofpoint-GUID: nplk88awBZkGQIrfNfSEOcFiLHDuC7IZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1011
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280140
X-Rspamd-Queue-Id: AAD7D487587
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59864-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]

Destroy allocated workqueue in remove() callback to free its resources,
thus fixing memory leak.

Fixes: 519a4bdcf822 ("V4L/DVB (11984): Add support for yet another SDMC DM1105 based DVB-S card.")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/media/pci/dm1105/dm1105.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/dm1105/dm1105.c b/drivers/media/pci/dm1105/dm1105.c
index bbd24769ae56..e915d9a3f785 100644
--- a/drivers/media/pci/dm1105/dm1105.c
+++ b/drivers/media/pci/dm1105/dm1105.c
@@ -1194,6 +1194,7 @@ static void dm1105_remove(struct pci_dev *pdev)
 
 	dm1105_hw_exit(dev);
 	free_irq(pdev->irq, dev);
+	destroy_workqueue(dev->wq);
 	pci_iounmap(pdev, dev->io_mem);
 	pci_release_regions(pdev);
 	pci_disable_device(pdev);
-- 
2.51.0


