Return-Path: <linux-media+bounces-33526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD34AC6B88
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 16:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 852B11BC5702
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 14:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E44288C38;
	Wed, 28 May 2025 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHUtPla8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D008288C1F
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441751; cv=none; b=CTO4ZshRgE49lNiq3WFaa8q5NGga8b0KUxjVoy20VmRV0Up4SXtA3RwYbIfMsOoShRzPXIi0cGL608h+eQjDNFDitWLBDQ6yk0p2SQU6L8t+XrwhNJri8hNwF6lBPTf0SrZwl6nilbk/3sKjvjbAiattUbdeoyqKSMlG1YYzFbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441751; c=relaxed/simple;
	bh=oH5seIgO7GikF7klnt9IfbiX24eWzPldETBsqQsbdgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsX55xME79aHQyoeoJ7eCuc3WDuaaUE24DZ29G/JGvOSzHp9Xh0OPUHKFlkkZ1OMP2tKV9PqGdM47jvNRVCAF+c9Ko2HHYguIs9al1sP6RfTsY0NH6h4W6i7ga1MOZLj6ZTD+YmyN+mD+kCxCHCyHJsDZJtwggZjrAfBbeqgUHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHUtPla8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S800Do003699
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 14:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PKKIFVUFjBYMIYlOdCe4wRf/
	gEEm+3cc8dZgEMLxB3Y=; b=OHUtPla8m4LJ8EO6FaK2J/jO34HZo7XpCdeRqzZI
	+85e80eqy4DYaXc166F9v9bHMULmTJzO/vm3OT+ECGY1sF/rsa1sgCW0NkxW1KVX
	5hS9E8cAAlqLwAegGxNzciC5i6/CJyTSnIpWiX/vRhdnVcj+d1SrqxD94V56PrBP
	5if2AJG2tm5HBCF3/j6BQfNTJm3B87B7tQ//3qJstJotYnePjPhAMrxiPYLh3a5W
	MtDPDGkYf1t/4Ebb6GDZZS0hqn7plCK00DkYhu+Wq7jX1e0HxIZeB1fGQxM02tfM
	pZiITSdgaPzglE4bBiaXpe61OKXuSjQgwXxo1Gk6efO0QA==
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqan5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 14:15:48 +0000 (GMT)
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e7dbb4aa3beso3422659276.1
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 07:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441748; x=1749046548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKKIFVUFjBYMIYlOdCe4wRf/gEEm+3cc8dZgEMLxB3Y=;
        b=ODuNosw4+T6Qhpafkakr4Y73AaOPPScZz+T3Sg8QJJL001pmdAughRuBE7JCqZZlbE
         i4UmBzs+GrCq5GovfPWOLGeQ+JhAX32hPfliIJ1lCF1fUOql+WOH6nI9PLvC5ZmLXXXC
         Yhc64j232UAnfeIghSU4Kr/FhDoA3A6FjBUS8Fa/cHWglhY9gXwuvDTTtF5A166OfhMs
         O6CUr4eCnJPLNx9Rir6bC3Q+iGWd3++bnL2xb6x7TUqwRmntvNylbQLNjgxu4D5m1qUx
         gjCg/Jn+TOyv87zNfkcYIA1efCIwj7OuGAxxYnqMGwj4Ct6rewaNWNScFnpSfS/xPXIy
         VJqA==
X-Forwarded-Encrypted: i=1; AJvYcCVqnAkQrz885KTsrfHPIaJOdDskUVDvsNG1exGHCWrZ5ZqO6bbtbjJtPV3uvwtBO41/Mwv4Jj1TzRDCQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfdieszWFBuiNkLIMJ3JaxCLSdd9VyQmprvNHrMTSZ7UO49uuL
	DIXUx6zn4xH2c+qFFGcwLRbykj20387zvpqmO2yXctoln+c8HM+nxNnt7UHauO+fIsoB7DylOFk
	7M+cGLi63+X9ZMUgg/A0QFA/3kMXGRE6rtk+di7H/IXM2hw9cLyPp9uBlRuXa8jHR0w==
X-Gm-Gg: ASbGncsIq1l7Z611kaALCsXX+WraoPwa1r7scrBCP1dQAUYrIFaXwZH5ojK/X+bn2Fw
	zPNdOP2cYC0k3D9izYtEaW+1EZrpCvabM0kOYesIZLWIBa6ekOB0KPFT5fH2KFDYKJiioDuMPrA
	10uunBmfnkrgW2fB36oIbK6v5P0Bs+bDS6VZWbLhX5g5Aah2NdkzGsNIwz6STB5H9CucXfUrpNy
	UKnnJcTfjQqSuAl1XEwSwkDGg9Lc0rfMm6YQOC1qM80kKNPDg2NWiIdRpeMqq2mW3OW+QjZMiZ0
	Q5DZQpnZAn7mVr6teR7nTjKgIATd8h2M/e6AjdIUP4vm+yXB0Q5gfHFYsTny+ClfxWlsIShz/ew
	=
X-Received: by 2002:a05:6e02:1c0c:b0:3db:754c:63b with SMTP id e9e14a558f8ab-3dc9b6d3b48mr187418635ab.12.1748441736749;
        Wed, 28 May 2025 07:15:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO/qLKlIuHWvcnnRm0piuVuCFI+VpDYEPSMU6XOu9GU61UnMzyorzXe9JnyOOAIzHoUfmr3Q==
X-Received: by 2002:a05:6e02:1c0c:b0:3db:754c:63b with SMTP id e9e14a558f8ab-3dc9b6d3b48mr187412855ab.12.1748441732235;
        Wed, 28 May 2025 07:15:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a635sm297843e87.86.2025.05.28.07.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:15:31 -0700 (PDT)
Date: Wed, 28 May 2025 17:15:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 0/8] Reup: SM8350 and SC8280XP venus support
Message-ID: <d7gvn7awccrhg4ie2c3vicxpknqteo27rxnlh4lfsecobz2zpp@vpwug3qhufkk>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
 <it3njgklhnedjzojafuxpjy3o5zfulgdclweyobv7kjgtpjmzx@6opje7yms4yg>
 <1dd6e03d-09be-4853-741a-4fb47b7619a0@quicinc.com>
 <70891a99-d2ca-4fd3-a88d-2f66a9a78f66@kernel.org>
 <aDWZmJMIOVyzu1Lc@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDWZmJMIOVyzu1Lc@hovoldconsulting.com>
X-Proofpoint-GUID: CqPxnxTV3CsXaJqet5UBIt0rjNFESv2I
X-Proofpoint-ORIG-GUID: CqPxnxTV3CsXaJqet5UBIt0rjNFESv2I
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=68371a94 cx=c_pps
 a=peiObFy/9J5zY6vzkL/ViA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=kLdZMHmJudiyi1bg_n4A:9 a=CjuIK1q_8ugA:10
 a=uSskPZdq7w8du69dlLff:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyNSBTYWx0ZWRfX3UI5LskbwD9f
 Kg47HK18UIlJ/laMypovg1mIfzNJCpWYBkNXthIhGZ9YAlI9FpEDaKse4fCzVRVuT6KZbemHSA0
 V8lXGsfiTeiwaJ642Y5M9xFLCuS5STjd2Hquui2ZydxjJQG1Y/aNcr6pdyo6hUC8TUUSJq4ZWVA
 OBMIkkxAeyCtfjTP9XGNvbAO8AGDbjSCvs/gweOB84QecgKdF6IxuF/0ohTdlFEnZr72zxVjYfU
 gfSGL9lLGBSbWXYi8VwEV/4NgEEo9iZdRzc2Srs36cZiKg1kZCOpZ99QTELl1jEJRv2CBkFcpI0
 NK2alMlHgU/cIXvvXy83bOt51vDsz1Yfke40KINDvz87c+Wby1GlQF8yWVAQJw8ngM1mlWT8+oz
 rL03xN5GUYknieqh3k6il79dnfHvXyfxVXWPVggHcUiIvMbJwstyF4qutVSYqql8n1XTO8pc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280125

On Tue, May 27, 2025 at 12:53:12PM +0200, Johan Hovold wrote:
> Hi Bryan,
> 
> On Fri, Apr 04, 2025 at 10:02:47AM +0100, Bryan O'Donoghue wrote:
> > On 04/04/2025 06:24, Vikash Garodia wrote:
> > >>> How different is this from sm8250 which is already enabled on iris driver ?
> > >> As far as I remember, SM8250 support in Iris did not reach
> > >> feature-parity yet. So in my opinion it is fine to add new platforms to
> > >> the Venus driver, that will later migrate to the Iris driver.
> > > I would say, from decoder side all codecs are there now on Iris. H264 merged,
> > > while h265 and VP9 dec are posted as RFC, there is one compliance failure which
> > > is under debug to post them as regular patches.
> > > If we are mainly looking for decode usecases, then we should be on Iris.
> > > Preference would be to stay on Iris, otherwise we would have that extra ask to
> > > port it later from venus to iris.
> > 
> > Right now venus represents 9/20 - 45% of the patches being churned for 
> > sc8280xp.
> > 
> > https://github.com/jhovold/linux/tree/wip/sc8280xp-6.14-rc7
> > 
> > This is a good debate to have, however my memory of what we collectively 
> > agreed both in public and private was to continue to merge new silicon 
> > <= HFI6XX into venus unless and until iris hit feature parity for HFI6XX 
> > and to continue with venus at that point for < HFI6XX.
> > 
> > So merging sc8280xp - HFI6XX is consistent with our agreement, the right 
> > thing to do for our users and a big win in terms of technical debt 
> > reduction.
> > 
> > I will post an update to this series ASAP.
> 
> It seems things may be moving again on the firmware front, so could you
> please respin this series so we can have video acceleration support for
> the X13s in 6.17?

And thanks to Mark, we indeed now have qcvss8280.mbn in linux-firmware.
It would be nice to get driver bits reposted and hopefully merged

-- 
With best wishes
Dmitry

