Return-Path: <linux-media+bounces-55876-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H+HEnXSt2n0VgEAu9opvQ
	(envelope-from <linux-media+bounces-55876-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:50:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D16D729760D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BADF302EAAE
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A50938E101;
	Mon, 16 Mar 2026 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkIpYnIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ae/QgGRU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B3B26059D
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654345; cv=none; b=dumRffVD+ccR9xZiEGBKZNpraZ2pv0AwNJDA13b7SizLc1RtHSFs1tLSD++Cgi57O/lbY/2Ca5/3T/mxHlMmoDKEsKHUbURwhnpk2Vy8GULMNFButFDFwpv3hxITd0MNQzOgF/i6fE3zp6xAbzVliXF2zaOBwsH0XyrQ74RyAZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654345; c=relaxed/simple;
	bh=wNifxD/uVuc7NAbXzSxDhaJ7op2FNUcGF/+rEs7q8XY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=neQOiYXfZVAKFua2n5OOrLrnD/9F2g2yFnDhSg2C3oBmj7G39/h+LE3u/vI6CqrBG3T87kv54S88o3GFLYCZ0nGfscq3Bdkqt+4bB8ijgzxHLZf5EyoZJ74Egm5oa5Kb7j9oNWBrux7Hl1dLR3mKZHAl9QNxiXDMfcXdeQvTIic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkIpYnIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ae/QgGRU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G7mqrJ041563
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eZX3+pV1mLh4qQV/ja7HXP
	0WPf1mmp2fnKR9a3HpTPE=; b=RkIpYnIBHca+sMT16Qy0AUvaVdmiMC/ZMaDeJw
	nudeVmDv68Z0PU1UJ1zceSKj5smRxTI/jOGS1e/JGesQ5HKc5B0m2kkd4cxtPsve
	qPylS5qhdkk7yzcgXLQ6XyDTDDwltTQ3yyNCCtB1zdjB84kBCB6yFULjlxlw/K4Z
	4uomx0/Idy6zBMQvuMh78Ucy1YqKsgfJSe4nV27j1XN0gzLlUmRx4J4KaWvWRQmE
	LiqZ2snYGLS2bpapFcpzTud9dxsxAvAmmsbDj5kbE6LrCDrLWNWCNaTjsTwcnCNK
	r6PWGbLNsdyqN7RlCw9rszhOJlHIKzOTSjAZdxEpwweJFa2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt80dn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50900e9803aso294923271cf.2
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654342; x=1774259142; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZX3+pV1mLh4qQV/ja7HXP0WPf1mmp2fnKR9a3HpTPE=;
        b=Ae/QgGRU5CTzgyyqoEWpShJ/xGZX5zCSN0RSgfLn+vVLCN3FczDGrs0/JYdWhQV2lt
         yG+CIwVI2jTq1bh7St+OWknF7nN6LM7OstyZT0m8L2DB9qT+uYajfcylk/9lkxgoqOc6
         34iMVnO1qEqZ7o8hEeUNn1/Pcnq6m+5ChlQwthulFlGCtFzTpEelAYUdmItu0OEGO0cE
         HO/hEP9ZxkCzsDdjx/nXrQqoQJVgmdj/ebZPEogCSh6iFFiyvqKWyeeHHWYLewda7EWv
         JYpg+7WTBnI0AMChNlBYM4Wr3h5y6wv5okT7FaOfyk0d9df8za5y6J//pDCq8zhCf62l
         eK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654342; x=1774259142;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZX3+pV1mLh4qQV/ja7HXP0WPf1mmp2fnKR9a3HpTPE=;
        b=Pjj4k8ri60XUIMoRj799sKu9f30wfAnJpkGs2A1XkwmrxHuehx1vwzQDk8i4Zz/dxq
         oOdWxo/QZHvrVS7g8IxJy3QTkEQfoFDxL+br40FUQ0CtQQYzX2D552j/usyZwyrJdl8M
         S3eBsLe2ZqSottQjb6vsr6v9Te+3UqskQETv9DKRjnrgYPzCnTq8/VU37ranBqhSbmVW
         nFFMiMSvhRVYn3CJPBo0ZBJX9HWbukwFg2O1hzC8NEfBI+qiIefwo6rPXUCOcK/UIfHs
         55O7W1j+Q6Y/FMcXNyXHAqlhNYoOfki6Qkeq1eJLVViV04oxODxfHMCTaDanhCx/gG23
         UGyA==
X-Forwarded-Encrypted: i=1; AJvYcCU8lqD/0opv4WSh7bgG5wsy6Ne3KzJHzJxrhKq3WUTgyB8m+vW233cdomy9Wt1rQsRH1OmrRK2uNhzrog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYtkxISZGEitij1jkP3gDLVQZ71WbmvI/D3peYWNpiIrmdDUDB
	9jJAOKpSEQfOk/vYdVNY4IB4uxzg3sVEjsY6fF8QLo4y9jZtaBGChiCw7Y7EBAMEAMiCf5zUCPq
	l4oCXgBU5WnE1G/f6Xz7kNXXhkTE2/yO0UECRdyORpVFq3g9fk4PFjya396CNcAmcEQ==
X-Gm-Gg: ATEYQzyEou8dgjLwMwoZSOzwSx9zOHtnMWSYze6gubYdU4y8DlzxgefPH9X9nu7iyHv
	2gzLhXRVdFWvrOl9GODxkqdFfPdfmk+jIMx6QgY6+mEBhi1COZ8hPZrrC9UL8bW8litYb/sKOyf
	LJJs6W3M3gqIvRgxhQPNb348u/Uq9tl9qn9URjHDroJpVqRViA+Mx00xemEutsSyoycWosoNlyZ
	fwzdhiHDib+88FBt+JruEY+fk0PktdlYnRC91OzKTA+SDWfiuL2X6xYy9SnZXBaOiFq25QQ3NWL
	GL49QqESbUt4+eRiLsQ6VLjG5yxBR4jbI+HeMHFZ5qxg7fmKeL7DfJ7WMM06ed+5Z+kOF3CaxWK
	/ExhfMzER+jqUyepOVabrgodhMXf31/vwk9WH7gTm1NbB9i7NrjuK
X-Received: by 2002:a05:620a:4483:b0:8cd:942e:82dc with SMTP id af79cd13be357-8cdb5b24ef6mr1646094285a.41.1773654341668;
        Mon, 16 Mar 2026 02:45:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4483:b0:8cd:942e:82dc with SMTP id af79cd13be357-8cdb5b24ef6mr1646091385a.41.1773654341260;
        Mon, 16 Mar 2026 02:45:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/9] gpio: remove uneeded Kconfig dependencies on
 OF_GPIO
Date: Mon, 16 Mar 2026 10:45:20 +0100
Message-Id: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADDRt2kC/3WNwQ6CMBBEf4Xs2SWlCk09+R+GQ1MW2Cgstko0p
 P9u5e5lkjfJvNkgUmCKcC42CLRyZJkz6EMBfnTzQMhdZtBKN+qoTjgsLCg93rzMPQ9IujbkjLd
 OWcirJVDP7914bTOPHJ8SPvvBWv3a/661QoVdbY2tGjKWzEViLB8vd/cyTWUOaFNKXyKp+Ia1A
 AAA
X-Change-ID: 20260304-gpio-of-kconfig-e257ea7c9a09
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wNifxD/uVuc7NAbXzSxDhaJ7op2FNUcGF/+rEs7q8XY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E0vDJ6dx7Ia4fQ84h8eE2etKlWvxV+vL3m+
 FEVG19udtmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRNAAKCRAFnS7L/zaE
 w6/JD/90RDo1/kiO8qCAJrcGU364A0L3DxLqgOQi4iAqM2tT6AZ4IE8R29waLnPi/L94XNMGssc
 6HxIsy7Y3Ohu7YbbfxiNadlDhwEg4QMApO1BXmGT7W6fGaMT2tujzIZ6P/trHTtxPCxSZPMbm9h
 B0Yk4F+ywcUCsz7Gfo2fflEKhwsAZwFbqUBajx7MdcfyVG06fLVTuOm0YcrxNs8H3zLk8TrRRLj
 y2vRZG/XYSoDtRBSaaaD2C/CEOPsRUnoKlqTIfgGwvhEmmek16YWzK+KI+sh5IRsDtq3H1lckrL
 kkVeGYBIf26BclCEVCYN9DImO9zVCx87bHDlap000sJ+jKQ6B7dNX2rzdnyXjOVP09M2LNo54nV
 B4mpWGWorOKR/74PzhcrIJW8U4jBDOtpXy3wN/CcOvAmIw8gkOXa6SKZRmqQ4LkNyfX3gvtPaR4
 XMzn8xIsNQfoXqRA4MMgKnuKvlTUwohMokVN7fSuEouA0y32kxCZf0/HKcLxr3pYphztnqNr63k
 iRLkyCoSuqmuPq+wBr9QhvOnwt9s5ralyNijLmHZcfnl0BJcKjESTvYqKk2onuu5C+5BFSun/M/
 A668YboqoN3Qf3s/yg1NIYO6jISfe+v7bKqUiWThxSvIU/hoSR11H/omw20ui5GzM72/Mv8Y8Tv
 BB/HL11BpfULi5g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 5QuEHwR_osm5jIgtPZa3-cm2zd7ZkYt5
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b7d146 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=RbMT-lXscSRh0E1VkaUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 5QuEHwR_osm5jIgtPZa3-cm2zd7ZkYt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX5g/r98kBUuK7
 WMfXJ13Pa6Ro0EnTTh0+MmbYXJWB/tx4lWCwQTw+l9fPzSq9PdywvUd23jc/8zDmTf/Dp7I82eF
 ex0QsZoXslChBcsYFr3eVLhk4rSofwQYTyV+GXTkRjcYzxQwhjTvi6IiqGuVKybeOHScf2s3UCl
 nhFTFUh7SkLxYfXQDAPshbBOZoHdLcUEQA580vGMnZcizV/CflAa03iU4KAPL8dhYUiyHjuc18D
 D2a2NMclDd0+etSECzeqyUyvHihdD+1j1C7ooc0e9AYj7qoHf0e+Y+B7gauiwE8oF0a0vIUGey5
 joUs5sQo9DxVj5jNBYPRmWjaES6/51sdMHLtoSrdipr52FnhgGjkGh5YICmsjRvx8PG8BhExZz+
 rwOrHavbZzdLs5fyEJ0H3bqv8CqhmOzC1m5dZtcOa41ZWYC6RPzO20eptRaGLJHGCqNqwO/L0kB
 gPIKjUh84mYJ7nm4KDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55876-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D16D729760D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

NOTE: Each patch in this series can be picked up independently into
maintainer trees.

CONFIG_OF_GPIO is a switch that enables the compilation of the gpiolib-of
module. The module itself handles GPIO lookup via the OF-node tree and
is automatically enabled on all OF systems. It does not export any
public symbols to drivers. There is no reason for them to select or
depend on it in Kconfig.

This series removes any such dependencies from Kconfig. If a given entry
has no other dependencies than OF_GPIO - they are converted to OF to
avoid new symbols popping up for everyone in make config.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Make gpio-watchdog depend on OF && GPIOLIB
- Drop picked up patches
- Link to v1: https://patch.msgid.link/20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com

---
Bartosz Golaszewski (9):
      arm64: Kconfig: drop unneeded dependency on OF_GPIO
      net: mdio: drop unneeded dependency on OF_GPIO
      gpio: drop unneeded Kconfig dependencies on OF_GPIO
      leds: Kconfig: drop unneeded dependency on OF_GPIO
      watchdog: convert the Kconfig dependency on OF_GPIO to OF
      bus: drop unneeded dependency on OF_GPIO
      staging: media: max96712: drop unneeded dependency on OF_GPIO
      power: reset: drop unneeded dependencies on OF_GPIO
      media: i2c: drop unneeded dependencies on OF_GPIO

 arch/arm64/Kconfig.platforms           |  1 -
 drivers/bus/Kconfig                    |  2 +-
 drivers/gpio/Kconfig                   | 53 +++++++++++-----------------------
 drivers/leds/Kconfig                   |  1 -
 drivers/media/i2c/Kconfig              | 12 ++++----
 drivers/net/mdio/Kconfig               |  2 +-
 drivers/power/reset/Kconfig            |  8 ++---
 drivers/staging/media/max96712/Kconfig |  1 -
 drivers/watchdog/Kconfig               |  2 +-
 9 files changed, 29 insertions(+), 53 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260304-gpio-of-kconfig-e257ea7c9a09

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


