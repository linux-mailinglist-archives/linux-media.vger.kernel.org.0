Return-Path: <linux-media+bounces-52702-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNtSKa7mjmkDFwEAu9opvQ
	(envelope-from <linux-media+bounces-52702-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:54:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E999134364
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D71CE309549B
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 08:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5333A349B0C;
	Fri, 13 Feb 2026 08:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVKSzuGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NltH4rc+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D82833AD9F
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770972790; cv=none; b=BV/jCdP9hQb0CM+2xPhD4jy8rMQte7lM9iefYk3pmn7wnZRyKP+04R1bPek4Ozj7UK1De4J4gaQ4aAZgDZjeJqQ7Os913L7g/jz7uCEitKaYJepxvSL364ZuecYgnivv3ZwJMWslvKjndIw+jagv/h2N4NRhuOdtmOUG4mSjMt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770972790; c=relaxed/simple;
	bh=ZQ5etSyHYx1J8ATdnj8MDv6RUDi2SosCmRFB5eHl/u4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NiK4yRYSMmlVzPk27xRCh93vaJcFLy/ni5O/iTvg6Pua725/b4Y/mUd5s11VwZQSHmCkdEgvYDKDnCBvhsriUFWkvuVDwG2Mu8XoN8xM5SzoIYO7Uz81iETabY8cr5ETHAHA/HSvsv8+ViNXB7/O1Q4jGa7jd3El+t4CAlTN2a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVKSzuGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NltH4rc+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D1dFUa053350
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 08:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sLzeGazBJzkIMsho/B/18RlNxwoh279yGY9
	4HWXi1b0=; b=cVKSzuGGszUP0FKrpjlxLF91I/KlopEwADvLIrSnxoysXR/+wN+
	lTcmNkfc7Glb/YzSBuMdcgZWn11wFbALQaDbviBIZU+GP7bMHZcoBuoFbY/89qVk
	FPrwNuJR5YApuvE5TO+gZDSRBLm8eIMOzr8xNvTy2tEwlvI3Xb8dp55tvf1I2TRd
	NBP4dt5wi9zuNOSFelCnfdBPqyKzfrgoz0cV2ru2Rh/yPLwwbmJnar+d8kap9M38
	huRL4KDC54+Zz1qY/tTJRO/DNCdZPvmK1miOLVfl6V7hhrDtp0F7h9OnVcowiZc9
	3r7Ue+9KiZuf++iiFEe2vvbhq/XnLvIi3VQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9jgbb62b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 08:53:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70d16d5a9so226636185a.3
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 00:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770972788; x=1771577588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sLzeGazBJzkIMsho/B/18RlNxwoh279yGY94HWXi1b0=;
        b=NltH4rc+nIUFjSIJ3z7cz4pXenipORYnJ+5HaRU9rcsD/rW68kb2265sQ8vh3Ay5np
         0E8cPQqd1ipyctfEw7AJlAT1PjqeogY7lGQs4px5TpmPMcPABFvw5WbKJPlletbG2ysx
         VKp2oDI+d9xq//pLvyyrVEq6Cp3BFV6wlafbScB6H03fow69zBWYkfwgf9XEJ6pKT3fl
         5URazK7vIKhKxOt8jSKMTGSXIgm1NHQQ0LMdYwyqFTB7rt/HFpsgGUdCPlJfJxla5+/A
         lOLXqvCrU1PU+tGPpCbSsrJ/jn9UP36wMFlP2kUChsjJY0QEhrkAN9Qb4h5E1Zt3sAv/
         Yrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770972788; x=1771577588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLzeGazBJzkIMsho/B/18RlNxwoh279yGY94HWXi1b0=;
        b=kHh2JzFFffzS01zav6/tLvpZKtWs0WWkTVU3jL4hFdRbhGXDMyVnKCFwMRxw79aYPZ
         zhsA+eMN0smmMcehEFj9VImAu9YKUVR28SXxTITuVXSCQ9pg+gU5+wgBLNRK3Ksn1aWn
         9vQRdUsIFYG74Atn2xOp5n92RDsbLT7HhEBYwQBxhNZP5dpFK3SibxSbhwtb8JMgi0gV
         0XBuWP20sr7HelH4lQRsKHHZxXZYkxlptOFwN0HfiqD36iS3SYoxyZYP2KWXlJ4IcThl
         v6gIYHH1/7++qFN1q/6H6BsOSVYi71EmXfKAahBj3QbZv8D77lu6Uza4JjijucTf88VR
         ejNw==
X-Forwarded-Encrypted: i=1; AJvYcCVMUNQHTATwHHh8LSQqJ0+vj6Ocd8M72/LHR3CBk3wAX32ca+7Zjd4W+eYY5Y6FQGK+rv4PngrrgUcmfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw34YoC1FTKXNesyURQ/OKW9QyOQPb1APPBWOZ31K1SiY/3QPR5
	14VrqHZ+CFjj8bAZCoEepgJxqZ8MRa7SubUVW8LPBeTWhf5knS0InE612OBKTzRSaBwe7BnnHdD
	s3CKpBvsSPDo0ZWAJgcipXSe0Gorh1UkJivbcpRiQH5XRb/9S7sPGlwaO74UzpBqC
X-Gm-Gg: AZuq6aIgAB9RJaDi9Aczs1EZlviNat7vQQSH5O8sJKgUiY0xpDv4q4TRjKGlQhcLHNd
	/BytEUwNyTmkAhPSWTx6U8MGaEunTGh+zdWN1N5G7ugK6CzF2Sa6daLH8vQcE5E+uFOEiWMtXjq
	klfZAO8f8tRRxMqnQMvf+IlVblIjwB8OmrdDj/HuFtJz3Im+txQadQCinPSNDUN2rYfFFZtMnmF
	Pom0FMBuovM20gvn8Xwhn/Az08dHcb8vJ/aVCaWwHvHS92K7CycP2LSuJU7awQ6YizwS4tmdRC8
	KfBsIorar+T/vvAXdInSdkkDpPIK+AI3Opkm0QUuRiTU3cUQdwywwgu1GguRhlwVoKva3j0rKuz
	gawLF1dbFAouIW3ajPgDQY/CnyGuWPjIzSKG1xAeV+UoRzWwRVF+Qm7jW1u0KOFFyCtn9
X-Received: by 2002:a05:620a:3705:b0:8ca:2cf9:819d with SMTP id af79cd13be357-8cb422ab85amr113660885a.26.1770972787891;
        Fri, 13 Feb 2026 00:53:07 -0800 (PST)
X-Received: by 2002:a05:620a:3705:b0:8ca:2cf9:819d with SMTP id af79cd13be357-8cb422ab85amr113658585a.26.1770972787369;
        Fri, 13 Feb 2026 00:53:07 -0800 (PST)
Received: from euvirt-devbuilder-04.eu.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc9b2sm3692675f8f.21.2026.02.13.00.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:53:06 -0800 (PST)
From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: Albert Esteve <aesteve@redhat.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
        Trilok Soni <tsoni@quicinc.com>, Matti Moell <matti@qti.qualcomm.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v10 0/1] Virtio video device specification
Date: Fri, 13 Feb 2026 09:53:05 +0100
Message-ID: <20260213085306.313348-1-alexander.gordeev@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA2OCBTYWx0ZWRfX4Uz5yBSFBMCe
 26ISS9HPpg5ul9hfgXNgKdAp+1Z+ofmBwv9yfV+RUQMG2frzadVp9HTz1C3SsI0Yi1ZUnDHwvOT
 S7ft3Sz9n7ftyGB4yzEY1JPD4TFQGpF1P5rMeHCd3BHoAtF1B22V0p0Bv8vAxo3EHpFDoVBKGfV
 0c7FADvH67asewYoVi0W/ptiI3aJJnGGymUEYrpDEpTJHTMISH9h1sBW7eXYM9xilvWPvIEU3CE
 FmROsg1T6eucWO/ofhLv0A9l/IFICJaegru9iip/HVHPrxFqdHi9s1fDxtZOs0VZ4LEpSpguyed
 lzPibiLH715jRpt2uPoWwskUE3+E2Oh3RZT+2bED45b9qUlEf/95OGUnD0RM6Ix5pnqAPs/Z6xy
 IZRIFJ6fZOWgeJqsTWP0DSveWLdx3/cQXcm1W6kaWu2pCbRbVa1QG9T7hlyDrLd8+LYEOJduUo+
 kW0c8/mWfV5A3NK2kww==
X-Authority-Analysis: v=2.4 cv=ArzjHe9P c=1 sm=1 tr=0 ts=698ee674 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=HDcqBCEvkTplNmHNSisA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: QfHgkj8WrifBBKmHcFcsoWr0CRbajhYx
X-Proofpoint-GUID: QfHgkj8WrifBBKmHcFcsoWr0CRbajhYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linaro.org,collabora.com,ideasonboard.com,gmail.com,quicinc.com,qti.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52702-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.gordeev@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E999134364
X-Rspamd-Action: no action

Hi,

This is the 10th version of virtio-video device specification patch.
There are some major changes based on internal review. I think it is
good enough conceptually, but may need few minor changes, when the
driver gets fully updated. It took a long time. We were very busy
working on the implementation. I hope to release the updated driver
soon. Please review.

Changelog v9 -> v10:
1. Combine both encoder and decoder in a single device.
There is HW out there that can do both encoding and decoding at the
same time (e.g. Qualcomm). Having both functions in a single device
can save resources.

2. New device ID.
Point 1 required the new device ID. I've already sent the patch to
reserve the new ID and asked for a vote. I took the liberty to already
put this new ID here. I'll send a new patch if any change would be
necessary.

3. Reinvented the internal queues, added per stream main queue.
This is based on internal review. Having too many virtqueues may use
more HW resources. Still there is a change in the scheme. Now each
stream has three internal queues: mainqX, inputqX, outputqX.

4. Now all stream commands return the results as async responses over
eventq and nothing is returned on the commandq anymore. This way the
race handling both commandq's and eventq's used queues is completely
avoided. Now the eventq is the single source of truth about the
device's state.

5. SET_PARAMS returns only changed parameters, GET_CONFIG returns
everything.

6. SET_PARAMS/dynamic parameter change now blocks outputqX to allow
driver finish output format negotiation and reallocate buffers if
necessary. This fixes a potential race in the implementation. This
is somewhat similar to what V4L2_DEC_CMD_START is for.

7. Added VIRTIO_VIDEO_F_V4L2_COMPATIBLE_LAST_BUFFER feature flag for
compatibility with V4L2's V4L2_BUF_FLAG_LAST.

8. The spec size went down from 19 to 18 pages.

Alexander Gordeev (1):
  virtio-video: Add virtio video device specification

 conformance.tex                           |   12 +-
 content.tex                               |    1 +
 device-types/video/description.tex        | 1592 +++++++++++++++++++++
 device-types/video/device-conformance.tex |   22 +
 device-types/video/driver-conformance.tex |   20 +
 introduction.tex                          |   21 +
 6 files changed, 1664 insertions(+), 4 deletions(-)
 create mode 100644 device-types/video/description.tex
 create mode 100644 device-types/video/device-conformance.tex
 create mode 100644 device-types/video/driver-conformance.tex

-- 
2.43.0


