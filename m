Return-Path: <linux-media+bounces-49917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A76FCF3EA6
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 14:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 242EB30EABD6
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 13:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28A933971D;
	Mon,  5 Jan 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUSeJkiX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpHNwAuv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA1E329E5D
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 13:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620061; cv=none; b=aw968k1bZWb1gQs8ntrkQjn+AgtxUWqSTbKqoD+tpIKVc9ejIjeuYev1zYzeNREpyjwElFmC6MaRW9H9gVqhzP4tvz9OfnZrNaO7nUT+iddLXcerv/3gHz0WzsG9CEwwTZqFvcfkutItLbRj0HKu7LBul4Gw/Z/v1ELNsb3xUWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620061; c=relaxed/simple;
	bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mrm0XbLplNqvJ4Our8wXC3BfIQpSSnMcuOcwtmXDoCjTn5sa0M0A9kxXtZ00VHoYUTwaJTajN3kMEN67DO50zbyp+KYAPke1nhOD9bYlAi9Lx2jva3pSeLkjszCxflBHWR81WwoTRf5kokk9wg752ubZ5b/VoGLArmKrnokSLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZUSeJkiX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LpHNwAuv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058L3bd3964598
	for <linux-media@vger.kernel.org>; Mon, 5 Jan 2026 13:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=; b=ZUSeJkiXhgraqhhp
	F9dBNlDU2NjJn3UYcir4XLIvDkfLIqXrqgJ770e0uuuD3xR1xmIrxRuxiT7ZeJzu
	zIq/lxvweyNV+PueM0rqT3bzxnqzHA6NMNB2l0a0205iiIeNgO7j9pvpT6N9XttR
	scrfVoTLyPxZaXSZJZvdRInISVIX+rGTIqDtRRNHfTWZzYMS+M3mNRvd1ntqtojx
	d82EKfzcpzT+YOJ4k5q8kZLPeGcJYhXp4b8IJ9pafjIUYq957UR9TSlxmodSjYtR
	kWhuTIa+ATVn01Z6oypoyskUU1kfupOx2KAOKGtFvKzmdgcp7PAvcBy3oh8TkUR8
	e2gXYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4kae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 13:34:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed69f9ce96so523308731cf.3
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620051; x=1768224851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=LpHNwAuvcDAhN0R/0ONOQTwtjZajIO2kwbTKbQWSLaFrHonY64ougOnYlXPHIMVPQk
         ATQ3HbyKDdLxSaGx7+0vS/wrz07qsGTZln/POBrYrDbWNJrDeOfRWL+BkbuzZpcnpIHw
         3vqe52tyqN8paqObxq/ExQRluJpnlB5ACMAHDLN7Hc++iUTJhFVsNLAawqrXi8jpSW9W
         tjuOVI/9kFKnNtC3ZYbtbYWeknQV4WRiH9iJBMoBy4f4qTbaOnLPaCjVyz5FpsJIH/PI
         b4UMHvMKfE4sUPDnk4++pvYDFz8tFDSA0ZcYONfRQfp4y8AbPstqdVM48tPIhKPdutab
         2YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620051; x=1768224851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=noKZk8F6JxJFsih8M3GOD1WjaS35McWLtP3IHJ038RUwGHxbeBef+VJWd25YvdvtkE
         arYVaogFQx9Qav2cNowQz6FWrlFG3/DcnjBZVGEWQu7hI/Ws2DNDDF4npRd89sRjRKzz
         PrDliqOqNkXqhAeAstC0GKIhHHUCKwkjKctUCelg6gJx6xrnpYcx8Wa4ZkMghp7pkPCb
         cyfbuPGdIcu9ufrLdPgbUW/rL/q5QjCJcpIEW3kf6WIKze45Y5QSxke78lYP2UjU0eFl
         /fPoXBU3QqJxP9bL5uuxDsdFg1MVVG85dujPG6SMttGyjpeXsytarjgPj8wMpJ2o+9W4
         h6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWI5vf1hpT4H0MAFMasMbmOjF6+0FW9rPS87OzTADLITJokqwhdmBF3wOLO41iubPQMU0+fag9XWsXsFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtmXyNVClGo4AW28asxl7DmVNtmAownGVchCvkA5Ja3XN1Nvua
	FtjUn6LjMdZbYgnxwU3KdSIm0Ew6Xax+FjGujc90lKN63ardjgWLx/mnBedbiMVmZ1uxH4Mcl4h
	ObtiWI1Rlz8M6730iLASkqd+VYp1qFJpKsOIJC3OspXqMQwum5+zllgPlH8NZFkk6LQ==
X-Gm-Gg: AY/fxX6EBAB50Oqq0m+NzkCyHLkHsWH1eNtky2MFobeEgiCkjIFkW0ty/bEn+gOht7S
	oM3KnOfbGADzD5XHzwQb7DQG4iV1d+WFNEzNI9wL08p20BPZ3zbvuCqJo3sKWOmGlEf6wc96M9r
	Oof9AwdXbFNySya7FmpH7yzTXZTn072xlmQt1POdBWoaSc41QSGMTLGbaXcTUW9SKMKs410fj5z
	dU3HlHN79F51UWvUY3PTE2oP2CPTS5kXdMUkYlurHLPkkRtag1KsJGPxuZpbntnWANoIg+aWKVT
	QVoKobaZ9IGjZtyJi9yxz2WFU7COvFI9WvRwtQui9u2NNO+zywR43fJpMlt7qayKMFGflenT3Mr
	9T7MrbKlyp/E5P271Pno8MpSpTNhsVrgvZA==
X-Received: by 2002:a05:622a:1b9f:b0:4ed:b441:d866 with SMTP id d75a77b69052e-4f4abd9e674mr707315761cf.65.1767620050717;
        Mon, 05 Jan 2026 05:34:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjkllDicKUX9VQMpUuwOZohyZvcZc3Sco6Qs7v09u/svEypj1zueiG6vlATp619yW0479jww==
X-Received: by 2002:a05:622a:1b9f:b0:4ed:b441:d866 with SMTP id d75a77b69052e-4f4abd9e674mr707315331cf.65.1767620050252;
        Mon, 05 Jan 2026 05:34:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:44 +0100
Subject: [PATCH 06/11] cdx: Simplify with scoped for each OF child loop
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-6-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW727J4D1GLQTEFCgq5popKtB8fHsHipG20NOw
 7z8v0h748+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9uwAKCRDBN2bmhouD
 13ZID/9xu3/z1GcnP/fuqu4umSBmakzQTGc8DuW+gIfzqb7Gxzh8CxMkYlfQpNvAoCYycruPEvm
 GJML8j4hYrwgMmBh3ewue+/gteRx4hOxY8jH9FcaBDWmanCk4BuDOa7siP9b6EUHPNnR+4dTppW
 DXVyaIvSvf9LYx4+EtVrCOhTAJlSjeItLFi622QVjfN96g+AU000wgNYtqmCjk80iXT3gLQfHR1
 JUVhEXtB5GQWMBeCliK5ZJOpcdHOVCtwwoiTXIFR2NeivDwy0jLt/C9WCSK+DR85oGhmrfBrVQT
 tInXNSuUDB99YTyg5PeUAdPYIs2+TGDYUHsG/ndluq7GBcij2t62nWH5SyvSsOyntrEQAjGfzDi
 06x9RjniTGa1+TA6SvqVmgBb4DRScfnZYz2MMu1NA+W7O2i1bH6HDbtXwh+BSzJ7IbcbPjG6U+C
 ZFKQlPvYvUm4pXyQ4ZCQzuYYaRG3RbbFC4TrrkC0sshupoWEcyVIEz24MaTMyqS2tNYjLlXFZV0
 y1xadk4qsAVMWwkS+k6Rbzx7pmClj/inj6npgzu8JIgPOVY+u48VcjOI8LYtbvs7kVA+35hKguO
 RZUWcDvabzrQ0gLOcftg5KUN6+ZhzN0HT9aOdPs1AnA8wU7Nld1rSagbCVv4iEw3rUF8io22J0w
 Ll+Nq5ST0Zad7VA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Olav4VIF39dXQtDvKyXglvkA6ozSLckw
X-Proofpoint-GUID: Olav4VIF39dXQtDvKyXglvkA6ozSLckw
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bbdd4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lBFd75AfmJVjEZM8J80A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX0jRPaVaFi0UF
 FOMczOqIiui8rE6aemfsH8h3QA5eF8f8eBzdtZZRvI+rlSPUeMsoxd5Qkp9DZFgT22eN/TLRtJ2
 ZZZtTRvCqjW2O/D9siwcF7Vymg5dIwToxf/VChwZkSqQOQ30DAcICYrv2UcHZ2UV7OORUUs7vVt
 6WafvyMZZR3THhF0YEfh45p/3LPMHIWlmuU/hY1+UkZOcRQueYp2bRNuoZMIT9kPOe7DhsxTHSF
 PT5gByb3odEfmRKCn0OHk4H34tr/SeS54OO/KjTd9P+NpNcz20CqYO9VzTxz+lLLyqH1/RNXD/Z
 yuteJZyFiJWh0c7KYrfIQ11QZ9rhAtr5N/0wXQi7WmXSFJKstTCbCX62wGVFiKenHYj4uZ/ghyJ
 cSdvL8xC+k0BEVApAt0DW5u0J2I8WOn31UXKWesATBw/KX65wivMPkn4vW6cbARfU1HdX768Pt4
 RFZe+Uv2XnZ6PBWP2VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050118

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/cdx/cdx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index b39af2f1937f..bbde529aaa93 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -608,7 +608,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
 {
 	struct cdx_controller *cdx;
 	struct platform_device *pd;
-	struct device_node *np;
 	bool val;
 
 	if (kstrtobool(buf, &val) < 0)
@@ -623,10 +622,9 @@ static ssize_t rescan_store(const struct bus_type *bus,
 	cdx_unregister_devices(&cdx_bus_type);
 
 	/* Rescan all the devices */
-	for_each_compatible_node(np, NULL, compat_node_name) {
+	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
 		pd = of_find_device_by_node(np);
 		if (!pd) {
-			of_node_put(np);
 			count = -EINVAL;
 			goto unlock;
 		}

-- 
2.51.0


