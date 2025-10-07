Return-Path: <linux-media+bounces-43868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2B6BC283E
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 21:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ABCF19A2E82
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 19:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC34B2DA76C;
	Tue,  7 Oct 2025 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmJZvMEa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CE91DE4FB
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 19:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759865705; cv=none; b=h5viTydfRTa1aiJFR2GL/xP1xvIBSAh4FXLwuXdwtK4Sm9N99nSaCXbIkSmEH5WP5p5MgL6j9KZD2emssYD0juKZTHxQgfxjrAv+D3629z0C5XGOP+4YnoQwUmdSn/IjdJ1zpVcmJiccOus2Ngr+4H+XIeBCe+5sA6up1x55wK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759865705; c=relaxed/simple;
	bh=wig0ZZyUy6dvUMp7li1+6/VNLVxhlEr3/MEMi8fh3UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nl0KLZZ3G9wlTWDkpPSdkfPqNCZNU933a9bxuWrmJZojmkyngbjeXaUrZmlF5fLqM2ygODHUNKVlNsJjaEw5r9TlLCJZ0d1M9DO/qJqXrdyrSL6MSIesiQf9GfjBAsxMuNHlKQFvOKXjqvrlYLI5HbjBaYLTlqcl9Ow+P+TXqKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmJZvMEa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET5WH025699
	for <linux-media@vger.kernel.org>; Tue, 7 Oct 2025 19:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=PvaVJoAJ0Gijus/RZwgfHF8MqLW4IcqzozVAjzVGhEY=; b=Cm
	JZvMEajRwKNXGpNzosoJA4NQn9MIt49ruOyIEiOYpZ49RItE9q+KLKVaJFarenxE
	kQh24oSfGoqFqCqXL2OqOtmAC1P7+CNQOjFABtnMnlrU5tiqLcP7Q7AC2Pg0Ujee
	7poRyDgBTODUA21HLgsZ6nE3T9sgw7n0X5kTO0JwEUEXzm4ZojfeVtte8Y/XsvNG
	hJpIJAKNyVe78VfDu1cr1ijKo0NOEnuYW9Ms46JlDLat01uvFndudxCGEpmz4Rs4
	QHXaWzuKYDvYw/ZgNHv2H89lyaijdO/eRqpYqIFO0gggzSWHgLywuYpPHg4S+Dm0
	Fr87B4pzsF0ChIloT31w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy70bwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 19:35:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d77ae03937so176600711cf.3
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 12:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759865701; x=1760470501;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvaVJoAJ0Gijus/RZwgfHF8MqLW4IcqzozVAjzVGhEY=;
        b=jZtUKhM04WNbrFBwIKZMc0m4zaMoKH8/rWEbMnCK0NDbtCsvDCdo36lldRnKGWQUC+
         wTOsleO4/TuboNO29dGM0uqh/qzPoqaSL9wU+KFFWXSNNSCx4DgbOp9t2850F1Qlalaf
         KZzre19f724vLet3GdFGX0L/flr8dpXrDgYLJSjlCiPAKCYAErTWFcYuFH2WNY5ECkqD
         T/2/WvK6jOzNI9iqVC1sjNYuoGWAt1vFamHy4gPXzwy1Gb2huOUo+rloINIKGnUHqlOR
         ABsBBaLp8MuscnDLROU/iF0uWOkYouruQwRGaMe+q3PiKnXFVWOCuUiYg1uVX2QSPAun
         Zb/A==
X-Forwarded-Encrypted: i=1; AJvYcCWRZq51x0dv8aLdw+rA++Yn/2yh4zOsdqMKPaENOG1HhP4e/VEAFzKZ++D8SSB5AF1z8XDPtODSdno8QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO4dvaJyUrBXcmVvHn3i86ESUMbQFK9bTMBvreiHmn4DkDYVXO
	9LfH5g1O7a+kFmdBJIHq8tpJtIBkpi7GXH94IsYftk/gI8xpt6049dhBK/Xr45H5tHz1JRvHVne
	CxsG/VqsBggA8vhe2zoiYR4TtZiftC9DP+aJWP06DA7hOnLO3qCIOS4zReB9O9+wHXw==
X-Gm-Gg: ASbGnctlOLKh66KUzG92ZfFjrr7A9nfuSAySxIrxo6PFhqPP0AixMwLZwtj30kGw41A
	NkxkDPAYduCq+Gfj1IHANWTHqL76puD/Ra919haFJNlbBesF4yYGnXhW4L8/FMVYhSfNsXOJaMm
	QGFdu3aIx4RwQ5LluqtJAE7v0jnRBGgBjUwxUrW/frSUJFQJ5Xt6Gk8XOEnduLqoVJM82b9CntR
	4j7i+FRLlQqCmohzTpwzCRByGtlIcdIoyc2SRWeZWiaNsxx0RMxUhRRv7IvUg88xbs5WGr5rezS
	5Jo1QJYoALasGnHhiy5iKpi8A7Mixisw/jFPx9LdaiedsXU6b5hrRF1LUIu5lZG6UAE2GO4+YvY
	IlrIDTRLbzwoozVi6DIerLxjziB9dpkJDiUL2SI9hsBqQYYsd94uTxFXy+A==
X-Received: by 2002:a05:622a:554:b0:4dd:e207:fe2 with SMTP id d75a77b69052e-4e6ead771bemr10781221cf.41.1759865701276;
        Tue, 07 Oct 2025 12:35:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhYB5jrIhIsoEiveBcI1+5csRppnfeSgR0nJsMQlBnsHGl4MPh8xoRA6HHDibeJe3352O9Qg==
X-Received: by 2002:a05:622a:554:b0:4dd:e207:fe2 with SMTP id d75a77b69052e-4e6ead771bemr10780851cf.41.1759865700740;
        Tue, 07 Oct 2025 12:35:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d3e6sm6348563e87.63.2025.10.07.12.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:34:59 -0700 (PDT)
Date: Tue, 7 Oct 2025 22:34:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Subject: media: qcom: iris: crashes on SM8250 / RB5 board
Message-ID: <rs3olaoudntfrnsgpg4nivtnyrdfqsvb3flnr6mcejih3me6zd@udzutvmmkj45>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e56b66 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=fREZMqYHaUzqRmr5ttQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: 9PpGpjxhbSrUAzaEGwPhSAbgQHRnMPDn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX7kRBP8pW6V9s
 UQwVlaZOz8Ii8QKPjUNpceLgRhQno9UO36Z3yKhTPlN/pSsYbQJLYfHpHOitwZveLm7e+QHluaA
 cjVfSl2K+7gVWl01T7+sMkZrUZuT0Io+feyZZ1KqtYzwpeCbaB7TIzlXYa9D3YTEJRUcvMhocUP
 72Sk3BMmbmjbR7z+0APObD3iq6J7ebja9+1XMVaKOQP7dw5meZaewqr0v3qzHTpeYyYBvrdPgKL
 z9yLI1Mkvh3PJWiOTianz0uDigBOL3TAyB9GglPUC/b3y908yxH488R73tdb62z/2CFxpTbAYey
 pT5A+fKDVhcuAFoYIqdMCIaW+5NFdZuej0nW56wbwpWN1pb7lipBgFCXlSJ0TIhZ4QSGjnOl29j
 NVNN/DDJbPkzs9sMDoGJ65q9Q7wXAA==
X-Proofpoint-ORIG-GUID: 9PpGpjxhbSrUAzaEGwPhSAbgQHRnMPDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

Hello,

I've tried running fluster testsuite against the Iris driver on the
Qualcomm Robotics RB5 (QRB5165 / SM8250) and I noticed several
instabilities:

The following VP9 tests cause the board to reset badly:

            vp90-2-05-resize.ivf
            vp90-2-18-resize.ivf
            vp90-2-21-resize_inter_640x360_5_1-2.webm
            vp90-2-21-resize_inter_640x360_5_3-4.webm
            vp90-2-21-resize_inter_640x360_7_1-2.webm
            vp90-2-21-resize_inter_640x360_7_3-4.webm

Testing H.265 with JCT-VC-HEVC_V1 passes with -j 1, but quickly resets
the board with 8 paralell jobs (the fluster's default on that device).

Neither H.265 nor VP9 testsuites crash if I use Venus driver.

-- 
With best wishes
Dmitry

