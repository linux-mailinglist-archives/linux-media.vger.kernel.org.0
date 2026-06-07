Return-Path: <linux-media+bounces-64071-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jw7fG2fXJWpTMgIAu9opvQ
	(envelope-from <linux-media+bounces-64071-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:41:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D805065185E
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:41:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Avd8w0Aa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XilW9kF0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64071-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64071-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 396D73008E27
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 20:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CDA32B13F;
	Sun,  7 Jun 2026 20:41:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B3231A807
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 20:41:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780864865; cv=none; b=k7m37LirNdVP7Acc4MfSlt0sj/hZ0euBjfMSA1zjfM7kcVfauwBbmYhmKs2ebVtlHU0aPnk29AjtQPqgQeg7sZE5Jd3gB8u0vlndMu/2pKKs3qEqVjUE5YlLvEOczYCso+6WNRF5kuRuSdpMdmK3HVAc2s4NdkB8B94aPKedACk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780864865; c=relaxed/simple;
	bh=+5m5rmf3V+hkSK5cmgnOj9hQ9UxG3o/gjBvZp+APxu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZ0wjm87wip5MG4QbCZbPueK3/ev5BfFws3pSkuJf8n5HxTyf7unZxTnudRUIeOjN0ER8foosWiyFL9+jW31uT5uO9oQlCboU7lLRtCYO18ogwqFTYbaGPLgRoRJ+iNMObYld7hg20battggZypjK6/OL7HgAKJ06GsLJTJPTtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Avd8w0Aa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XilW9kF0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkOsa441907
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 20:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CDWHOHut/TY3vww+eWtSsc9l
	NQKtXLnMeJFWCV2612Y=; b=Avd8w0Aa7nI1+ZDGfb/YFyJ/NWPbYvoJZAC65wHs
	7RaQ/DkIa/0Ei370F/w7xNCugSRbKvqbDN696VMiE3H+sGutCJEIE8Vxysugspj2
	8wIAcBkwoHpzX20QZhuvvcRFLbXawncxVasm+2+LXAutO2q0l8NCdFrrqRuM5GPg
	Z7VO2Dybq8UMAkqOJHBJFjSv36PbQq2UllWSpBFwuP2LXlyereGpbqM3dhmlbnKc
	GNnce4bzN7hn4O4mos8lze5bb3b95MBmOVtjhTBDhlbyz7oe6ldcSnese/BD1D2t
	F7PveVeORrqh3Gt1ashzcErRggdpPxZmi9RtMwEgEh1UvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1cm9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 20:41:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5175a1e32e3so105351061cf.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 13:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780864863; x=1781469663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CDWHOHut/TY3vww+eWtSsc9lNQKtXLnMeJFWCV2612Y=;
        b=XilW9kF0FVOVK+57fA7zPE7Ox7vuBMu6HXe0An+QygHl5NXjnIutb1NoBAdzfRhF4y
         p3qhuRbBtVzihJSoWBW/mESSuLhQ5ByNy/JqkjWdbHP/aH0TQF8LgZPdQ85ubopLZgo3
         JB8Svlfk+3Z4TX9iKqU3weY3sGi3zzCRVKulbUBD2ZtGMAQwuwRe6IreFYeoNcWZi52w
         3TPEoB1MfDb/y4RrFIHFaNjnQGqL5xiMEI6tYJZxCp58RYegUNl/rpOfN4hrQF1yHWSC
         jj+do+x2EF8+ENUXMz3qFYjmFB0DSo8tqpRFejpmA05qvENHeEqsBTIxdKYU744P2RW5
         9eKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780864863; x=1781469663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDWHOHut/TY3vww+eWtSsc9lNQKtXLnMeJFWCV2612Y=;
        b=dC0ordhsyJCEuZAw8YMmo+fnUJJC5yvUkM7pPjJUc6PVoLFtZAmT7+dpBoTRHufOCH
         2ZYGbLvafBC6Reu2nEddTVSr+pPxQZ602y3JbHu69sSCKYiaMbUWcN2ps96RU7sm/PQO
         cusIGBBsztD/PCDx6OswP5SRlKwYhRjMI/NIgQJAk8A3RWqgjPlQFiXJa+6Z2Qf6aUu3
         zTfylE/PmkS6cVUZ++y1AXfAWvUX0d+B8zdlJ13oSUyTUM8l6OLMr/+2O/W7fMHJ+uy0
         J8hDq+wze8h1UcWOiVOcx3bi4MlvR4PO3ujktS94+9eSO2G8V4Fmg6w/yncEdPRLQUuS
         cOqw==
X-Forwarded-Encrypted: i=1; AFNElJ+LQ7+81Vs9MV9Gl8j98UQhxlWju9/aQbPqgPKWoDEwZgsZlHheUNGnjNdIMjp1awIbVuQC5uJjDnoYJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDQ5sjeeFPaymXllJATS4f/NavqLFQUOYFHI2hiSGdjcrFOvdU
	CTb5E0Iiqgev7rnxSBVCsckOvTSjdFCbWIllW18ZGS6UqhabDXyj2Xaw6FsI/H8nzOZzU/IMui0
	NkKkiE2W0ZgozNHCvNiLNeN38mzo/5TsOyR7aFcAuOLU7j5MDySzfxZDILpIr2eRXbQ==
X-Gm-Gg: Acq92OGOTV0ZwW4BX6cN1QIUGAZr3STllr6rv9GQ2VdXuwFIh6KEzDtQXCa77PRjSZC
	m8Q3VqvRfnQF5c108rucCtULcXGh/xeLLr2fxG8SsHh1DClZvlRj5sDeK4yceJHzV8w2dlV4ygX
	qAf3+i4TpITfk6MiCuydMxCNvpt54woJI7qRmHFhlyGnlgZSoV7GUlrBeVK1eIgNPa7xE1XRDwH
	ccy8lra+F6E4xwtrHqwSJrWtyzy5NMhTBLWF/+w8gPTuiH9+NPluINhijnGDEyml7jsS8A50Gu/
	cpB+KRXTkqkiBZbEUwgMK7vyEDFJUwmgY8AVV4Ogf0uXmPYyfo2mMwGYLKabo/PvJi6mzPNtFUR
	dS51eMAwmTnbbLNGI8okCl4CkwUVJCUCcY3BHYU0M/6hKiDiJC5oGFIPrqoTQnmpvh06/y0joQt
	LEl0DVpbZ0X3kTDwKSqj+eucF3yfrm+IhZ/kmtR2i7x6dQmA==
X-Received: by 2002:ac8:5d46:0:b0:50d:9aff:8b43 with SMTP id d75a77b69052e-51795b72876mr184852101cf.10.1780864863019;
        Sun, 07 Jun 2026 13:41:03 -0700 (PDT)
X-Received: by 2002:ac8:5d46:0:b0:50d:9aff:8b43 with SMTP id d75a77b69052e-51795b72876mr184851961cf.10.1780864862686;
        Sun, 07 Jun 2026 13:41:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66b1csm40909481fa.9.2026.06.07.13.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:40:59 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:40:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: qcom: iris: guard IRQ handler with runtime PM
 check
Message-ID: <lg62hhytb4z47jrlpbkr5bwrxyo4cz3z3jkxf6vahuc3rxh545@kmae5ujp3xpi>
References: <v2-message-id>
 <20260604082510.45733-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604082510.45733-1-dennylin0707@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwNyBTYWx0ZWRfXzmbgLtc96nas
 otJ8bqr2pCosudBwrpl6O2ZP3yHgr+8a/8hh1garRZjzEDRB5YYAP+ASwVCOUJKTTAidGIHSnTU
 +yWqvc+yjfcwwl/5AjIo/+i+eyljPaIXY6BRe/sxWvcGiEUtnhOExiPWk60l4K9Jjj4+L152xt3
 SWGVWFNhnsbv8CnrtwlEV3eOqb7Ea/GwOMJVVRGZG2pCLrTyqnkWMY9Wtioa1J1O+se5YauXlhk
 s7yQPKvAze0cN1rLgNb7kx68jTy5a8/wBMD2GjcFuxjz4VzVZqqwDc3KhLCZv+W3CDorhsgygEe
 apre1zXSVSOzZ7gNI59yePv4EnHxskLh42fhQ3fnVgCNSxDRe6ldRPgnXN0jLhf+nevQiLcpOH7
 zXS5U4gh3Z/fW1LtVUhgZXRZhA6tfkZyaeFFvWEmvnC7mifhKiA+XtfZUvvJLj1xtDnFMMvpis0
 H9tOUxnovONaetmkhhg==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a25d75f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=TPyWUj72fWjUZVaPtgwA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OtqcrFAciddVryXVwo7kAn6WmNgYvpeC
X-Proofpoint-GUID: OtqcrFAciddVryXVwo7kAn6WmNgYvpeC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070207
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64071-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D805065185E

On Thu, Jun 04, 2026 at 08:25:10AM +0000, Hungyu Lin wrote:
> Use pm_runtime_get_if_active() before accessing hardware
> registers in the threaded IRQ handler. Skip interrupt processing
> when the device is not active.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

From: Denny Lin <dennylin0707@gmail.com>

So, what is the correct name?


-- 
With best wishes
Dmitry

