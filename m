Return-Path: <linux-media+bounces-54443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ic9B2n3p2lpnAAAu9opvQ
	(envelope-from <linux-media+bounces-54443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:12:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9C1FD559
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF28331B64D0
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 09:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83A139D6FB;
	Wed,  4 Mar 2026 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdZMEtFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EeAgRd9V"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025FE39D6D4
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 09:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615026; cv=none; b=Dwn2maqK3+SfB+IFJewiA3NUhPkFfpwC+AwhibvOSB4B39nQ1GXOGPsT9vi2Z9VGKbpxi9NSJ5kK0H3rU15KFbgRYkeImdTf0C6VSctChv9abJuoI2qId6ffjq2zUTZyRyxRKfKEcSyCpsyAULTFfulghdMa4XGdza1MFKDLVCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615026; c=relaxed/simple;
	bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfBSK0T7W187PPPy/hApVRTBoO7wJJB8DLBeQrgHR1wRGx523z1BkzOHcDk30c0QXOlpe3dct0DzjCE0OwI63Fm7TW64d7EF/JwRSbMJpxIy9Kg5y7jy+3HQsmE8pqCJSEKEaOAkbHqbDoyeSlv43uxQ+MDX/rqQtUi5uVfR+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdZMEtFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EeAgRd9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245T556946568
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 09:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=; b=QdZMEtFgACYOjWMI
	zjzVX6lMjeoh+r78CfuICfgv9KDzAQZTu6KfE+KrrT1ykTKi7e4CYCdfTNGINBoM
	QSExrDbqbBxmj3tBQiPFvxeuzRRQSDl+poZtc2GiB5rhgljz5+G24pLOrvcwewxU
	pYsqrxoXUJFClpuhe2E8leDDjPsdFRzIZJSgAfp9Ghgra0RJdTjdn9Jsnder13bR
	HbQ1qDprRZGko0coyeip/5xZo65evvgkr2rEJRBwt0V1xVKnMomV3AVasglwv1r7
	GtRyf+P4zvLDaw/qGQ04UOc/WK0I/6QmoIDXKz8etkL7/Xm9J9qSM5rH4oRpuXmh
	DZdOXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfcd14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 09:03:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c882774f0dso4198090885a.2
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 01:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615023; x=1773219823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=EeAgRd9VP5ryOgNVc2szVQmnRbzXvxCxq9zxBa7YXqqCZJ+gqBp8h9bq4xb+qpdWIe
         6hBH7Hxy5rsY42yfN8/DKWJNDuQ0/gD5S3WEL4TNOSyFYmwQoYRpZqvL92rUEYM61D+L
         q4cQn7e1F+kIll7CcEToWoj0QPKJYVmxuVbXF9vOlGXY/MMSFWcjvSmeQMLFK7EO7Rjf
         QHOnT1JWMYy3CJfW+Zgm2TKFWyV0VOwVHJYOxFw8px93W8+TTBfdly7xysUqNMaYY/76
         LCwI8jVC+Euj5D4n9rbvFyOo1lzLcrYwMw/LZeQcsial0xFOpc8StQgCwcQNG5s51vAm
         m0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615023; x=1773219823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=pvpRfdBX+rbf4nLblnc3kLtA9jf83LBq2gVLc256Qs7ubIlOxC0kM8u+BV9i1iEqOQ
         9+/1nIVw26whbge/rGfPbUD0AqXVTDHwRWWshw+tHmoawwmzJoLFVSGP8SLZzy9k8Dmt
         5DTn87D+Jq9SYRVHb2nh1LFP4VJ6KoxH2LPpxAkBetJIZ3EWKYCs7COWNnfXLuIWm68o
         V3GHUxhTBreSSJlVa3THRaM7WHg+XrwzXIrUWRa9JsSiu/sY3U7ESkDSO+TcW1vBAJBV
         /HEUflWLClL444w9VKPSxKW8DKpiHKcaab62cHt6pyF3P6XwJTzAe48YQe2uE07qTbZo
         c5XA==
X-Forwarded-Encrypted: i=1; AJvYcCUBCg6pfr7XJ2GPjaapWAx72Q+qWlxXOpWZtwzEtKixtArhEyMLGVbOvMJu2HRfabb/O+oeVjYgvtn8ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvflZSUaf7L1Qm3jhSACZH2y2lmrceTeKFdmbnK4JFws8J4O08
	A9iMX8MJ9nCcxGx2PSTF7BcQSzio3KrinD24Owt9/aMDls1IUuMJVej7bMl9yMD/qJJjh19XJZ8
	PlTe9y0tY/QE5xj4BLAIxzYH0CWy88ltDFgHbqmQ+0UHtUzsftM2di5rZSf2iC3CAZw==
X-Gm-Gg: ATEYQzyTLCTxzPBbNytYPocflTVQDVYY6lcEFaGbjUQ879bL12hKoSYWULsL+0iVnHr
	4hZangswkjmwmT3j/Xe9Dd2plsHzHAMuainI0cgQItzUcnzrweYtxfmifYwdtM89NTzz3Zd2Zrg
	PScijIGSiR9V14tlFB6FWKUvsiUkl4MfQJLJPSVbIcV4i3740XCMGFhJNyofx+auz8RQr6zCAad
	d6g/KZUyoS0BWWbAbW+tC/ypINig7pfijybcfHjiV0cB9jxRP7PcKNSIu1PnpEH0Q9iG4FoEB6p
	UBBK7tMOLTcFwTPPElD7kM/wT3K8MUkJo+BPXCKZDZer41xOMQpNY9tOGZKslTHkoLBRAlGNipo
	+4nUibABV0TOmyTIop+uF5wGG0X/iDjC42JeRFl6spk3P1tdKrhHT
X-Received: by 2002:a05:620a:1920:b0:8cb:72b2:2a05 with SMTP id af79cd13be357-8cd5aec6d38mr154000385a.2.1772615023280;
        Wed, 04 Mar 2026 01:03:43 -0800 (PST)
X-Received: by 2002:a05:620a:1920:b0:8cb:72b2:2a05 with SMTP id af79cd13be357-8cd5aec6d38mr153993585a.2.1772615022782;
        Wed, 04 Mar 2026 01:03:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:34 +0100
Subject: [PATCH 13/14] power: reset: drop unneeded dependencies on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-13-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U1CAGsVjzpABaYhlFKngSKy+KmCDgU4eXzu
 q57RqMlO2iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NQAKCRAFnS7L/zaE
 w3DqD/9PZaqFjzHPxlhtWo0GqKJVg102IgVfZj/tA1PX7Uxh4/ynWD06yEWrPqhz1HEI9+x2S13
 yT8h28khnaaDI7C4bitx1j6T6cBtXKG5ufSmOkJr7wT1tYcNZd/3B3la5kezelJHlO4WaYK2N6S
 7tgOp3PI+fHBk6JB3126BC2M2XslfGsNRD5RVx++QUGo2DzuXzmWeTr6TgOh0epi9Tq927CSyVo
 JhBLXzNP1AYZKgvUllA84Q2jiw1dqzcC+GXtZtEkFNtYaMJ+N7dcg+kCtF+lk1u4LhMyL5kosoE
 TIXVNq8/9DX5lElAy6BopXJ1esiI4bGjbih1MVq8q+b8OF3DjymUIjNn4q0Ycouumh/Sd24yOqC
 spOSRP4SpSQtdcEhskbiHKywGf6nSVFFAdQcTy0T9Ptf0tuBZSQqh74Myp3webWzBqORNxSdsMa
 a+XpmTJFYPLXAkrQ5UcoRhH2RJbwlcgxuHWQkuG+L3abK3YeuiNH1Wrv1zw4gUPM6/deV9ktxKG
 ju1I9zXk9Rt4mziW0BQZvu6PB5hSJYPW0c1cnhIkG92TA/65fHEvvVcxqAiYNrb87i+QKO2c7Ke
 jbLnEh8hA0NpgmS98XZAw6b1RSS/T/rS7ehewAVW243xTprAfg7qz8uO5ohQq9Lb+3RaXVhAzkq
 TicUPD4/aipoB2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXyGG0f/ui8lkz
 Bwf1oFVwK5qH1NFZO61BulV8k5xTseJkVEWL2ZyhwSnU9S/ir6hlKvJSbKoGEbQQivAiAIV0N9T
 pPeaPGeaw9RIuyUYscupro8dtrgm5Tvp5vicgIBGcY6rQm18BwH6YzKrA2DCo8hGj6PUVPr9GWa
 OtDmt/XNIOwVQ6APsragmT+JilXmsRTu3Z1BwfVijaQugp/zsIwQlda5HLLhZlc+jT210hAKoK/
 gWKavk3rcJ6eiUz6/rVkXXfRE2yy1upsIlCyAvaf6YtPawaiijgy54pTnQxj16ttY2CD87ny8a7
 Y342fiilZeFYUIClMhZrGRTNJxn28zNwAHUDFnde+t7VYffrQAW1oKYFKR88GddlyNJHTLodmkt
 A2FQnEWPW079JnFgd5Z6OdJyhCLuu35bH0VOy+FgLyITS82HmLYBrGp+CKfzD68Nab8fMNqtEts
 zLcuF1t1c+WoCoiSIAw==
X-Proofpoint-ORIG-GUID: XRauLGeXzVc-EZyiZRD8IuROSAxVmJ9M
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7f56f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=esZZGTiVAK7d0sqnEIwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XRauLGeXzVc-EZyiZRD8IuROSAxVmJ9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-Rspamd-Queue-Id: 9CC9C1FD559
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
	TAGGED_FROM(0.00)[bounces-54443-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,roeck-us.net,linux-watchdog.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. For Kconfig entries that have no other dependencies: convert
it to requiring OF to avoid new symbols popping up for everyone in make
config, for others just drop it altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/reset/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..8af398b4e6f7fc5f2ecd92f11d03c43cdefe1ab6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -97,7 +97,7 @@ config POWER_RESET_GEMINI_POWEROFF
 
 config POWER_RESET_GPIO
 	bool "GPIO power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports turning off your board via a GPIO line.
 	  If your board needs a GPIO high/low to power down, say Y and
@@ -105,7 +105,7 @@ config POWER_RESET_GPIO
 
 config POWER_RESET_GPIO_RESTART
 	bool "GPIO restart driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports restarting your board via a GPIO line.
 	  If your board needs a GPIO high/low to restart, say Y and
@@ -181,7 +181,7 @@ config POWER_RESET_PIIX4_POWEROFF
 
 config POWER_RESET_LTC2952
 	bool "LTC2952 PowerPath power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports an external powerdown trigger and board power
 	  down via the LTC2952. Bindings are made in the device tree.
@@ -198,7 +198,7 @@ config POWER_RESET_MT6323
 
 config POWER_RESET_QNAP
 	bool "QNAP power-off driver"
-	depends on OF_GPIO && PLAT_ORION
+	depends on PLAT_ORION
 	help
 	  This driver supports turning off QNAP NAS devices by sending
 	  commands to the microcontroller which controls the main power.

-- 
2.47.3


