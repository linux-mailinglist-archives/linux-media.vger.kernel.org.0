Return-Path: <linux-media+bounces-53167-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFlSD70XnGnD/gMAu9opvQ
	(envelope-from <linux-media+bounces-53167-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:02:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F0664173727
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BF97302BDED
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8768C34F47D;
	Mon, 23 Feb 2026 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TT0IGx/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JE7HaO/u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E4234EF10
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837221; cv=none; b=imxc3C+xADhTp2COr0yJberjyqZmL3xYLXPq3UVPJvgplWZgVT714tZdwyHWdjRDvNvZY2evlYoocjhS4UjptUmEUwAxPUqnAnxevqtLlPBRoSCOBiG3kstEEfHf7aJwQEdA6WxZMP6xsCgDLIbCGcSO+lZ2MuFZD1VwpPhx3/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837221; c=relaxed/simple;
	bh=+nrztrv3eun2Q963Kt+vOIIxHNHM2moiogYKDHo0wls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nAQmKN5hHlv3Kksxr/FCw3kJDmq+jGDZn7Y/D2LAUHnpaWvtNp3cN1503p8PE+jTP5htlx29peFvlqOR9IkBgDN3DXItbSVv4RoYlFboWCVV6dexstf4hKSyeEbN80OSSJ/sbafEX/+Bww+oMt5rAZZBbIL8G/Yy4wVJBCc0CIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TT0IGx/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JE7HaO/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8ajx01971340
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=; b=TT0IGx/PYUI1U7Ol
	kdWhf4gjUtimZksuqySAj9PKyiTbtTW1gVg4VkaQbbvu9xGcv5SIHNqkRkMHepfV
	g7twqGAQFobRdgsd/cXNgsHNgJ/YA4LMf2SF37z32lOEexmghS6ezEygxKPmyKYE
	o1sTZMCkUOkGo5df+14DsjSRzobWFnYlsht+rmhLzKoq6i2wMQ15klzZYcVMrAwv
	p0PuF9056UXiFL0Rbj2/JtKRmJGxsc/VS6PNggCqAb00Xs1LizbuKFdja0LTtSl0
	adfUiqxpOgTLQbwuOEuohEAlh/zIbFumspXaXWFeqmMNO6tKwnqQDWHqZfj+9wNQ
	woHLVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv2km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7166a4643so4420586485a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837217; x=1772442017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=JE7HaO/uWbc4aZ454SpeXa/TpDnqQNujML9nJHkwZzI6rpLaFv+odqpB5KU06wcTOx
         ZSo8B6BSUdfr1q6qMGuiEgPZ2uwSObVkLmqCIpya3ppHqpp36b9044SnK5eN+sKYH45i
         eCtXQXOETEgKlG3uOnkw8y6+GFazElQ4LC8oUWTF17vDa2lim6ahwQMFUn/5WI72RhQd
         S+7Q4sJGST8u16T9VKSTqEBG0JEt46cB/iL/K6Jf+YUCKrRImOeJJTSLvtclFFCztNYb
         EEGp1SG5HWqAuEVl2BXrGwwnSghS7FJF8VS3eQFZGROVjh9zb2gd4iuKGpno6YEkim4d
         R5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837217; x=1772442017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=v+WxlikjN2r0Yhy5ax4bj0pAXUnvO0lZv40SB1/n5cE/Iez9TcXSph8xNQdvBYvK8Q
         g92lzm5+yRKSOW8EMuDmJIZ566F8dxbKLC42NTVjIUnGCJPA4LAhHhMVAP9CN+X7Zs88
         aPAvXokh1aA7zbfU5n48u7hAkVuhD9VWAQndN3H5SW7p6yV+XAIeQSZdAevJ7lOpbgVZ
         bWC2ToxVWVZOayapSDQfZGpthFvdOQBzO4k9wm7KAJKpyv58VlRCFWUhaIg1uNP54yML
         ibMxOdb/s967suZYw59VjflrbN24rFlwWESieY1hacFeuFOaA8Imu/nLTsLK/xy7bDl5
         YOJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9JbmT9LoAxrh5NZ3UxjQ2AvHZfGbaC9AUwheULuFh/lwNh43z0wJob4jv+ews8/Kw438jrAwWl72p+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV6GGdmdNqY4e0/IpwcAOyrPTSweInKQwUOVhT61BdE9c1Jnb4
	8IYx2RUk8Ap96piRZfDvYcJuZR3rXgnXDLtFPImpgHXO7gK/97srVyXLsq3hSxRgRjIyrWBFPMO
	EYj6cZQu6QkfzDcH79ODqFMHlR68t6vjnREAFr9wwDeSzbxygAhhiv3+WCn97hqCeVg==
X-Gm-Gg: AZuq6aItMQlbdWoyUciUBk2yxW4luJ/bc7U3Cq/sSE7VN+dK7hsj9OZ6mjxqQfETnNg
	h5SFGtj5HSgahjrofzvYCWbms6EMHfhD4sfxQEc3bjH/VQTsW0FRunDwMLnuT/jbynMRuZz3rWB
	MeYBT3DxohpQ7anR2yAopnLCLPNWLvbtYAlNaJBnNdDQUVEq/nczXuyM+05iHgZzMLYZHO68BWs
	vtu3Vo/cXyWJnHzNPBUQ7KhiWgo63u4YsQkmqLvS0vnz+mir+W/n4fbU2FSN8MYrb+8eaUjeu6k
	u4l1BIGQb6moUlYXbWoCxSwMTjStFY+q6A0VoLo+1EP4tY46caQnFPcw9+3aaP+xkNWeDzgvi1f
	09KyKDJV7hK0fvFmO9IMUCR1FeE7dqTUZce194NpgaHe+KPhCbtOZ
X-Received: by 2002:a05:620a:29d1:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cb8ca6e5f5mr946105785a.38.1771837217156;
        Mon, 23 Feb 2026 01:00:17 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cb8ca6e5f5mr946099485a.38.1771837216730;
        Mon, 23 Feb 2026 01:00:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:39 +0100
Subject: [PATCH v2 10/13] i2c: owl: use i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-10-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+nrztrv3eun2Q963Kt+vOIIxHNHM2moiogYKDHo0wls=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcG0op/5Rmmcmy1LClzr9Cd5rvHSa2IOhyh+
 IHRW3jceAiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBgAKCRAFnS7L/zaE
 w5oqEACL8mqyvJjis6Rfx0rOWs5khRMic3wAg6GrTXJNenvQou1AWcDbjBunSF26We1tgWQEmf7
 VRCVaQ/cWoy6LateYwLbZVzpk4XNFkbere/m43SlqDPwo5mWGAF7HmASiol/gc4AnJ6gGEic0Zk
 47TiKxSQ7+nj4p9k2Gjf1BALtw9qKgtTXgZIQkG2Mipxi1fV6I3KnMXvY9LLcSdSanBeW6wgYBF
 EN5KAfr8gi0sGkley7vLr0vlCaL9fJUw3wvnoxaGcjKZPIqbjPJAAbio28UP7cwtt1fv7nTw4qo
 MtkuZG76tz6CpvoLwK7i8qoNFOZMHmqKXVY5VwTVHUa6adviUk/UXcsECWHknfSL1o/F28QPipQ
 TOxHFbOj9KmIGFJ1/G6YiO54Z13GwZRCEBBXi+KYgh9e6Dg3XJ965Z589WrWaJO2Si1wCWxNTZK
 cBuTsMAuNvrbrkcZ8vFSM96OHqLs18szgWhcgb3nuLqXqd5YdBfpms2I6hsaz9DXxqnTGXoZSBM
 1vNqLs2epqXyzG6VlfibW6cEzyb+80lDvbacE7/aVxEjQjMS8k5LTMSKMIue8o/ZvU1Qs2Q0kmW
 eBqKRa5zfF7/AswvNJrigg31veDBrNwzhG/+0B6u8EH6op2DaYyv/l55F29zOnJkV5kC9vi8FKe
 EXKVEvxa6w8ktEQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX1Fr3eLdoJsSi
 whhbt5YYYYmh0YgaUxqyDxD1Vu+NdrfpAF9268o0CXq5XAzDc3KAQs+eT6sm0oJW3vDJzqESKbN
 sWrvwJCsnj+TdRE6fkq1xB2BJwAFqFvC+vN6aox1T9VfUQjFzx/VUXJVycgJsoX+wsG1h/sJUqK
 qmt/3+B77IHFBp3GMfDOE02CnixresjlMJ9sCpGeJQUJYvcr/nSMn9HqZZ2qEyo96r2o/UJfbnK
 gs+jqKh5REDoKsKROIGjTe6iYWitV63sM9+rkTGXuZgc6PKXTNNaou4AzDK6BQfehz95eukb1uK
 8B42J9UwXFp7DN4uL23QDXETvKTRgl43CQJHTDTFMEpSzJqZBYYf1T7yyqhPJktDK5tBa5Sp0uD
 gPFhSeQJ0Cls5ZsmC1TuLzOwhltk7nKfa+24WZCA+6jBKrdpM7Efm9sbIryunGEw78xKPI6uvD8
 QQdShWvBBidKsfw2tuQ==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c1722 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=td_-LIo_6SHiI0BopBAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: L479C3homrWL-ePNibx6WIoGImyNcTA8
X-Proofpoint-ORIG-GUID: L479C3homrWL-ePNibx6WIoGImyNcTA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53167-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: F0664173727
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-owl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 84a195e358866d693fb6d435a5beaaee640fd2e2..17718f15a0f1fd238bb4a6f23dbb4f9696969ed5 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -241,7 +241,7 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
 	timeout = jiffies + OWL_I2C_TIMEOUT;
 	while (readl(i2c_dev->base + OWL_I2C_REG_STAT) & OWL_I2C_STAT_BBB) {
 		if (time_after(jiffies, timeout)) {
-			dev_err(&adap->dev, "Bus busy timeout\n");
+			i2c_err(adap, "Bus busy timeout\n");
 			return -ETIMEDOUT;
 		}
 	}
@@ -383,7 +383,7 @@ static int owl_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	spin_lock_irqsave(&i2c_dev->lock, flags);
 
 	if (ret) {
-		dev_err(&adap->dev, "Transaction timed out\n");
+		i2c_err(adap, "Transaction timed out\n");
 		/* Send stop condition and release the bus */
 		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
 				   OWL_I2C_CTL_GBCC_STOP | OWL_I2C_CTL_RB,

-- 
2.47.3


