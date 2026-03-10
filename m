Return-Path: <linux-media+bounces-55150-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHyPLP4hsGkkgQIAu9opvQ
	(envelope-from <linux-media+bounces-55150-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:51:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA65A250E9E
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D6CA5310B1D1
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4D13BD23A;
	Tue, 10 Mar 2026 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmYAtVsg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCM+LpjU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB693BD239
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145111; cv=none; b=QZJQ1y+h+wU40de8lRMN8yBKnM19iVVA7CGLAfLH8wdt1VDPCZo4PjvWxJ8hTbmmbmHBwiz8iAQbzcKhnh8EAdGXChduBd1KMv9CD2nadgzszV11M1sqKo3aSEImsbmxZQ0KXcCZ+sxmniL98AJxl8YvA4j/MQNKNBW2lNH/HW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145111; c=relaxed/simple;
	bh=YvNdvszyE2lsrrAQ7e54czLWdZ1wg7UbWeDiOz13MRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qMngFfIYachlY9CCzUEk1Qz++n6JN9gPf79AhdAVQ34g7NrZgsGfrAQIRwviv0k39InOz3LF3BnGxb7zrg/pKOSHO7doDjBQEJ4lLArBtOQGMvzOZN+eJ8ctkOCm9t8ZRFZ6TDzGIDzxWRa1lTWcjxbRmredlNCWrJo5SEFNtI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmYAtVsg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCM+LpjU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8h3KS2754017
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 12:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Kcx9FUMYu4D4XmZ2AQwHO7mfymNrhGMABVT
	zrvRMnwQ=; b=nmYAtVsgvV1NEcCJAgWpoQeNeBIh7YikGyf6rSspJmzAjjFodhT
	/5SR4nMREShn0UJJ+i7lxQBaZ2by8CBVOcag4T8IEkIU05GgvucfVBHWpIRnBbQl
	LMRvW192QUF4eQ82FfNPq0d+jUMOvi2OHlc4L6/J7LyJHZvQ8t5fUZ/bSYF3GPi4
	4O8AlIjoILHUFgmK2oO98Yout4G0ITFKVpJ4Dj7gswtTjf6HMoUiFsCE+woEDB2D
	I0WSiUfieotdwvX2Tf+keqDIGRWNyGyW2bsjzqqNlxAibk/af79HvPr6LFI43Lid
	6ahtCeL7ycD5JLBtoIYFg/hAGIFRzCohZ+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mrtcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 12:18:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd80bea54dso1368168385a.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 05:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145109; x=1773749909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kcx9FUMYu4D4XmZ2AQwHO7mfymNrhGMABVTzrvRMnwQ=;
        b=OCM+LpjU81eB67z+21K37AurkNe2KAovqWVQ6Lj0G83VJscVLaLqGxJyNox6HWHi0Q
         ZoRRjSVTzuMSO1M2En+HsfgqPrxS1oyIFDnsBvzLJ39hD7KdUe3H++v4krSt2zxBehN5
         Joe/u1mnVpbLz9VYF6CAqRgwAlc2D25dXBLmq64rRJ1LTPCNNeUE4gYFuNq4hDRNoE/V
         7GhUh6NtXB6cJgwuL/PYmacfsL1M+AILmGfMw13cf59fXyLPhIdQdU0qN5R6g6rmE/iq
         8OCVZEJPwHVqx8lEoEMbdH+WyZzHpISD/Y4D7eRbJN/j3dMCV5L1nmde/MrJWD3tqryk
         cHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145109; x=1773749909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kcx9FUMYu4D4XmZ2AQwHO7mfymNrhGMABVTzrvRMnwQ=;
        b=JvC8Ls+OgCmfjG1/kv1r/tFZdrQq5Lyyb9V5zTcLTaUjfJJSh08bPXeoyJZNSDMWqO
         YjMvDsE597o4s+e3hPcykCvIw4YVd/2ceetTmeW9cHkge5/TnZgWNkuwxynlC7UQewjB
         cYTjx3tYZLBNtB6WE9gnkceqp1+jvcUqI6Ztu4gv+NmwqpX4gAfIYfgXoP0cQxo7ZkhV
         MFmSaq2qHDPFjJ4CMWcYAWCo/WzRUvt52nJLVsFk3tJWQd4IyZm3MKqgy/NUhQ+kgr28
         pfjsvlV0uVGs5hPcp8Wks/xkE1Vpr71YtHAWwj0kpXCepeSrFaXebYnRoYkRzaZVR9/a
         ydTw==
X-Forwarded-Encrypted: i=1; AJvYcCWACNwSTpPw6fjq5r5Nq8OlRXiQxXbcjcRt43cDdZ08wFt7rldjGL9w9ip9IBqgqkfwNBwAloe+l7S5EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXYG6YKuDxh2HTIbygiahivjgBDP4xprGj7QDZB7FaojAIL37A
	wjeSSQC6XF9LS/txZPThaEOx74yjxTIlp/MGcUMPD8Si9ApytY7s4KzWnJ1OmMMaEgU8mDyx/Uv
	jkY2I6JfcrajP1XJpqEpB6DY+jqcwMs4DaUL9iQ2r1dkcT2WeZ8NW+LMIP2XgbSuilygqoAuVGA
	==
X-Gm-Gg: ATEYQzzJguYYnGx076F0NT/JNtujzEOxAUSt00NU99Lpij0QaGL4M3iQ93RtlDzflWf
	abf5muAw96r+bIXP9J5shgll55zAD4LOHhd7rJUE1Zi7jC8P3SfxCEmQX8WL9J9tQLnRobwKBxb
	QsXlfqQ3LzduLtnEIXJ7xp2DeciDYQR7NHgQPfC0xHObrd/MVTU1WdVwokmHfryboqyJRaej6Y9
	OD3BGrRQyTn0S8M4f5pXQFQ05jP8HTpdwyDt3sddCPQMEEQYW+rD4lVkNNGUiqcMP7c+4OBo+Dh
	rPT8GJ8f3+TvRCGRTfINhlUR/BQq+dDri148u0xLDlEOtgrXkCgMTygwdklXxqjjxrFicNnSCWt
	/M9rEAj5hqMfgJmSnxkxOrIpabVgG5aZy/WgkkrwU5eFmE0gT8WHHXT5G9k5MSNJOfJ9jrYigzJ
	maTUZuet7uP71/AZG6bdecsioJfUfrtDPAd5C+
X-Received: by 2002:a05:620a:5d99:b0:8cd:7811:941c with SMTP id af79cd13be357-8cd78119565mr1047202785a.54.1773145108665;
        Tue, 10 Mar 2026 05:18:28 -0700 (PDT)
X-Received: by 2002:a05:620a:5d99:b0:8cd:7811:941c with SMTP id af79cd13be357-8cd78119565mr1047200785a.54.1773145108210;
        Tue, 10 Mar 2026 05:18:28 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bdf8sm38006504f8f.25.2026.03.10.05.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:18:27 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: atomisp: Fix alloc_pages_bulk() failed errors
Date: Tue, 10 Mar 2026 13:18:26 +0100
Message-ID: <20260310121826.35519-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b00c15 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=rhtmGAynrO4bll50VeUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zZi-wM4imKXP38wBrQoYD-VrHogfpEKE
X-Proofpoint-GUID: zZi-wM4imKXP38wBrQoYD-VrHogfpEKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwNyBTYWx0ZWRfXyuC8wgIANlLg
 /3zK3xD3pBSi5AKsx/JBrfGxCJO5OgNKnnWlfjBdW7RumTuEj/5XJ7fBnyi5NwOKc5TGI0cEXEr
 4vP7oocWPel9PMczzmTe9eAisiRkPRcOhH5yKtmoCPhn+h28XuI3PoKPgx4iiWNzaIebAmkMYEF
 d1mZ8B+pIOjAmT4vo9LrusEuFIVFt/ZE7I6mVlfiLx+3dIJDQ2JjtnOgIgQIsn1Slj/pIqUW0dl
 NYpUr5nWYp8md0sTBX1uOvA3n1g1n+XSvENsZ9kwTfIX/4zAv59SuYvKLDR4kUqo5wKZ6BjQ3Xk
 ecATJnX2WjfhNcQG8lVCJApi+kpApugEiz5A54psLADkZAMPwkfMdaKA2XgiMuhb9GPBvu8AHWx
 N+kkIZhPbfhm6sMGppgk857aDqg6x58mOJ0S9EE/PgQ7Z7OfvPlFdIpWu1Ogv0qZWffBGkUJ2ft
 UYlCNOMjwgDq9jh0j9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100107
X-Rspamd-Queue-Id: AA65A250E9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55150-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Systems with the atomisp ISP do not have a lot of memory for modern
standards, so these are often under memory pressure and alloc_pages_bulk()
does not try very hard to free pages before returning an amount of pages
which is less then requested. This leads to streaming from the camera
often failing with a "alloc_pages_bulk() failed" error.

vmalloc() also uses alloc_pages_bulk(), but falls back to allocating one
page at a time when that fails.

Do the same in alloc_private_pages() to avoid these errors.

While at it also drop the weird custom GFP flags and just use GFP_KERNEL
and drop the dev_err() as alloc_pages() already complaints loudly if
it fails itself.

Closes: https://github.com/jfwells/linux-asus-t100ta/issues/4
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 5d0cd5260d3a..59ee5f488b2d 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -620,14 +620,23 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo)
 /*Allocate pages which will be used only by ISP*/
 static int alloc_private_pages(struct hmm_buffer_object *bo)
 {
-	const gfp_t gfp = __GFP_NOWARN | __GFP_RECLAIM | __GFP_FS;
+	unsigned int nr_allocated = 0;
+	struct page *page;
 	int ret;
 
-	ret = alloc_pages_bulk(gfp, bo->pgnr, bo->pages);
-	if (ret != bo->pgnr) {
-		free_pages_bulk_array(ret, bo->pages);
-		dev_err(atomisp_dev, "alloc_pages_bulk() failed\n");
-		return -ENOMEM;
+	nr_allocated = alloc_pages_bulk(GFP_KERNEL, bo->pgnr, bo->pages);
+	/*
+	 * alloc_pages_bulk() does not try very hard to get pages under memory
+	 * pressure. If necessary fall back to alloc_page().
+	 */
+	while (nr_allocated < bo->pgnr) {
+		page = alloc_pages(GFP_KERNEL, 0);
+		if (!page) {
+			free_pages_bulk_array(nr_allocated, bo->pages);
+			return -ENOMEM;
+		}
+		bo->pages[nr_allocated] = page;
+		nr_allocated++;
 	}
 
 	ret = set_pages_array_uc(bo->pages, bo->pgnr);
-- 
2.53.0


