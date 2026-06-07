Return-Path: <linux-media+bounces-64080-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9LUGJmzmJWp5NQIAu9opvQ
	(envelope-from <linux-media+bounces-64080-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:45:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5BF651BAE
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:45:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aU2bBLzW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aJzJkc34;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64080-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64080-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45D71300F12C
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 21:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F1F33A00C;
	Sun,  7 Jun 2026 21:45:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB27E3346A5
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:45:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868707; cv=none; b=QkBdfJr+94ItZsZNSeIPjn12jGgYvAg8a83oDdLjr+Grpkr0fSrAmBUCz8qabMTUH7jVobBOUQZNaHwi0li5lGEGHpML+dodaGrRC8kOs+bmJA9vOtmdKEKFqPOWXyrBnw7KBZ8NzEUyWb8ICQjGLIgy/kQdQsJjkuYEaFwVrW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868707; c=relaxed/simple;
	bh=+bwN3DIrr8Ncp5C+NOFj+WmoQg9K8nfxp+4DlYtqUF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdScA74s4PZQRVsyAoB3PVzc5pTgeM0ZSWGJxOP+a8c4CGVjeXA8MHvCzeMadRDmtCAzmapeCwm8gV1f6noPGmudQgqLDqsAYZjWb4mKnzqexIAUrMbdPMS5Qu4HF5gUeELp0UBSF6ggBjm2pwH6Y03ay0Kwpz9pz+kuNJ+sM6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aU2bBLzW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJzJkc34; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EjZi7440015
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 21:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F3pLuFKIhp+LSTwGdUH8utJW
	F1UNR+G2MEHT2U/zAmI=; b=aU2bBLzW8+X0m4XsOrHSN4Eb1OU8T8l9s9wWbRrq
	AtHwVrDaCIWvan4874a8wee+CW96RyyGtsbCFLZlP5DtqQLHOjsxiQ89aqftF6dk
	53Dh6qmBI6VeXoor7C0Q0oENmYZFCykPpCZM9/yDK0TDt0bXcvB2vD7LuZ1W6Ll4
	c9ocyfpAKBTp6d1FQGkQ6dHa9SdVVpyVlIa8sGjww0woX2i3NfeISfgFJVibaP9M
	iAIpoYjVmPhYa9X+9raQ1HsNHfy16SPvWZnuKiAQEG7naur2lm3QZdc/m6jNDzNL
	umMWRP6pEZZYwgPj3m4ib6G2ZtnxAUj1KFoW9QiM4D89Dg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cwba3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 21:45:04 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963d24c3886so3361594241.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 14:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868704; x=1781473504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F3pLuFKIhp+LSTwGdUH8utJWF1UNR+G2MEHT2U/zAmI=;
        b=aJzJkc34OBnGP5NmgnBWxlEjMtFNLudo8v8RESEa5ABtNDJ6YX7xWu3+gytxTp4DG5
         00PGJ3HDSq47oZhCJgJIszovUMtPQDOxRWH5crXsYTLJkuzJlYGYJQaPteWvFJUEZMtc
         tsXA4vByKSZAZP6/EnkJpScIvPsI/+khdYOC17aRec+C6/NRiRS1Tl+SDBbIw81cvOJU
         xfAyhlSVqiIeMGfui0VMkWwaDFb1+Oz8lT5/CHJOLVG+YM4Z69yj+WrHMcTklaX4BZes
         /iqoDZT0t60prjW62ADwMprfFObigLM/qL8htDrJVQC7KcP2q5Thn0EWjDDKQyrFxi6O
         8G6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868704; x=1781473504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3pLuFKIhp+LSTwGdUH8utJWF1UNR+G2MEHT2U/zAmI=;
        b=dTFW8Fv72Rr0hpqhAnc4obimqznuZI/omzwuawKsjadUgd8KClKQsGHKL0jHdOPay7
         qsbQh5yLH/fe5m30AhAdgOyaAbmln5j7FjSkk8Cs6F7PTjDSjf0mfFtklltFXzuJIoBg
         XQwUOYm0vHYRCdCg1XI0f/qsETa0jHk9CRuxlTIJlnlBJuwNd1S+MwAQ6B6SjvRPVfA9
         D+PtyQOHPbb5yUEB7mBQ6NhLdsxajKNYxr+gsctnHH1QagpKK47XZ/wPiYYeb+3i52/S
         1rf2UBagM6MSiQbl5bGdxg9+mFR+RRXI+6r7P/sc7EzE5hGqYOsSr9MxQd31E0k561m/
         T1TQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YpMcUESWMhLmeqjjJdLUwrp/juW2CLyZ3dC02FALeQHwQ5WEHtWPcAg80ML1fQBJwh9llLggTixhjkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrwJx8zCKoSaHo4GK/cCDivPmgVo+qot4B7VQPOdoKoa0Zynkh
	s/0xYpElHheUhg8i2R53rfffGt2RlQY/HtAezILLKi1QYSEHxUPuGKGa+utLHX5CvxlDqVoKdnE
	Pgdlc7vgOeo9hIU76itN+i20ulOg5HQ4aiOfpkeFm2MIRw1ybzK8P9Ufi3hHlzBV5Bw==
X-Gm-Gg: Acq92OGG0ERH+yaJ+n5W45OY7QwhqGIKwrhNsZrA+uoRv8xL5IjCzgzn8Gn9CeniaRU
	7rDkdiIVakNRFyYFemh2k9nkXNCvE55UfNY8Te4k5GIrFosBx+5OjEGzzyk9D+D1W9nKB7TcCVZ
	INDgH97GZgCG5mEUwj02O6yD4cp3SbViFAAZ6UmLCxC0vBQfDOIOT9ZMuoW7QcJHGUX5mk5gyJ2
	+8XyweMSwuVtZgxND4Gns5Jng0K4+jtXtcxUvF+jF6UML35xhm/2ePjHWM29Px5DYmiBxGnAb0H
	QprkyfgfUaadhMrC4+d/Zwuyy7LSh0rwAXYYG9pNEGngtJO1hKoKvUGcHO/qLhNu5+yhdgV8+rh
	yvkX7iT59usEqRUAE7YnBuwJyIC67q1iXwJ6MhQgqQ+d8WtCWSWOpgaxYfAGx4w5u9o1FfXjeUu
	zIgJjlOmDzhGG1JbsWWcB8VX5VNHB9VJzXwpg5HcAYjQjf6A==
X-Received: by 2002:a05:6102:1612:b0:660:c9e5:8d95 with SMTP id ada2fe7eead31-6fefe3beb6amr6622682137.12.1780868703811;
        Sun, 07 Jun 2026 14:45:03 -0700 (PDT)
X-Received: by 2002:a05:6102:1612:b0:660:c9e5:8d95 with SMTP id ada2fe7eead31-6fefe3beb6amr6622675137.12.1780868703392;
        Sun, 07 Jun 2026 14:45:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b986c42sm3316452e87.58.2026.06.07.14.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:45:00 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:44:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v7 06/12] media: iris: Replace enum-indexed clock and
 power domain tables with per-block structures
Message-ID: <h64x7lp43zd6ktit7t4slxlr4fprqtlaijzslpeqtxpyd6gar4@kadh2diinpmg>
References: <20260603-glymur-v7-6-afaa55d11fe0@oss.qualcomm.com>
 <20260603143718.A65981F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603143718.A65981F00893@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfX3FPW5NDffxaa
 rs/patLzfU9TUjuvwbeT0IUOBLxjLIFsanqbVSRyvQuAcU2Rb4+3Fovq6stH0axJ9m9D9IWxlg3
 heS+ki+UxjpGAHy/TOEQMOZNZbKPt7rDc2innXVMePN9YekwFXdI7afJewuBE4uciWzWgsCAJOH
 CDe/9a8IHDhfWNnQj+yFZ5L2yiR4s3Fq60adWTz2anJ5bNSfpy54RO6pIdxcgOIojeed2sy3SZN
 QCTTSSfjwwhhRHcQ0YBK3RXj7OYYwGQyONb17Esd/eFlIyMPs6AOHh0IZGBn+L5xJqLRrlSwqcd
 NVY2AfvIwuEJC3tbBmuPVZFDHB2kI0oZD1CPQS51oc00sMsRzvCtDcucyw3TbNSBoZTiIrzXbqk
 DqyErxs3L0j+WkHqwGFZ6LMGlCtfF87XSm8rzxdiDR5l3jmuVrqodqP+qvZ0bv19RNRoJkJde6W
 tAncizY1U7pptkgZKBA==
X-Proofpoint-ORIG-GUID: Dt7E_eC7J24BNqjaO4ciNP61UF0hBBIc
X-Proofpoint-GUID: Dt7E_eC7J24BNqjaO4ciNP61UF0hBBIc
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a25e661 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XV5t3ym9ZgdjytnfEF4A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070219
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64080-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:busanna.reddy@oss.qualcomm.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kadh2diinpmg:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE5BF651BAE

On Wed, Jun 03, 2026 at 02:37:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> 
> New issues:
> - [High] Uninitialized stack pointer dereference when a hardware block has 0 power domains.
> - [High] Secondary hardware cores are left unpowered due to missing iteration over `num_cores`.
> - [High] NULL pointer dereference when optional hardware blocks are enabled in hardware but missing from platform data.
> - [High] Premature OPP voltage drop causes DVFS sequence violation.
> - [High] Uninitialized fields in `struct dev_pm_domain_attach_data` result in arbitrary behavior.
> - [Medium] API mismatch silently discards additional power domains if `pd_cnt > 1`.
> 
> Pre-existing issues:
> - [High] Resource leak of Runtime PM usage counter and OPP rate on error path.
> --
> 
> commit 569dbace99d0eb806398e44f1f3dd0f46e77e155
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 
> media: iris: Replace enum-indexed clock and power domain tables with per-block structures
> 
> This patch replaces flat, enum-indexed tables for clocks and power domains with 
> per-hardware block structures in the iris driver. It groups devices, power 
> domains, and clocks together logically in the iris_power_domain struct, and 
> removes index lookups at runtime.
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > index c2dcb50a27824..681db1da9559a 100644
> > --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > @@ -39,15 +39,32 @@ static int iris_init_icc(struct iris_core *core)
> >  	return devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
> >  }
> >  
> > -static int iris_init_power_domains(struct iris_core *core)
> > +static int iris_init_power_domains_per_block(struct iris_core *core,
> > +					     struct iris_power_domain *pd,
> > +					     const struct iris_power_domain_data *pd_data)
> >  {
> > +	struct dev_pm_domain_attach_data iris_pd_data;
> 
> [Severity: High]
> Does this leave fields in iris_pd_data uninitialized? Since it's allocated on the
> stack without zero-initialization, any fields added to struct
> dev_pm_domain_attach_data (like link_flags) could contain stack garbage when
> passed to devm_pm_domain_attach_list().

A simple '= {};' would have saved you.

> 
> > +	struct dev_pm_domain_list *pmdomain_tbl;
> >  	int ret;
> >  
> > +	iris_pd_data.pd_names = pd_data->pd_names;
> > +	iris_pd_data.num_pd_names = pd_data->pd_cnt;
> > +	iris_pd_data.pd_flags = PD_FLAG_NO_DEV_LINK;
> > +
> > +	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &pmdomain_tbl);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	pd->dev = pmdomain_tbl->pd_devs[0];
> 
> [Severity: High]
> If pd_data->pd_cnt is 0, devm_pm_domain_attach_list() returns 0 but does not
> modify pmdomain_tbl. Does this result in an uninitialized pointer dereference
> when accessing pmdomain_tbl->pd_devs[0]?
> 
> [Severity: Medium]
> Also, if the platform data specifies multiple power domains (pd_cnt > 1), does
> this logic silently discard all but the first power domain? Since
> PD_FLAG_NO_DEV_LINK is used, the driver has to power them on manually, which
> means secondary domains might never be powered on.

Indeed, both seem to be correct.

> 
> > +
> > +	return 0;
> > +}
> [ ... ]
> > diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> > index 773f6548370a2..fdc6eb68e5c78 100644
> > --- a/drivers/media/platform/qcom/iris/iris_resources.c
> > +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> [ ... ]
> > @@ -70,7 +69,7 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
> >  	return dev_pm_opp_set_opp(dev, opp);
> >  }
> >  
> > -int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
> > +int iris_enable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
> >  {
> >  	int ret;
> >  
> > @@ -78,66 +77,20 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = pm_runtime_get_sync(pd_dev);
> > +	ret = pm_runtime_get_sync(pd->dev);
> >  	if (ret < 0)
> >  		return ret;
> >  
> 
> [Severity: High]
> This is a pre-existing issue, but does this error path permanently leak the
> runtime PM usage counter and leave the global core device forced to its highest
> performance state? If pm_runtime_get_sync() fails, there is no
> pm_runtime_put_noidle() or iris_opp_set_rate(core->dev, 0) called before
> returning.

I think I saw patches fixing this.

> 
> > -	return ret;
> > -}
> > -
> > -int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
> > -{
> > -	int ret;
> > -
> > -	ret = iris_opp_set_rate(core->dev, 0);
> > +	ret = clk_bulk_prepare_enable(pd->clk_cnt, pd->clocks);
> >  	if (ret)
> > -		return ret;
> > -
> > -	pm_runtime_put_sync(pd_dev);
> > -
> > -	return 0;
> > -}
> > +		pm_runtime_put_sync(pd->dev);
> >  
> > -static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
> > -{
> [ ... ]
> > +	return ret;
> >  }
> >  
> > -int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type)
> > +void iris_disable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
> >  {
> > -	struct clk *clock;
> > -
> > -	clock = iris_get_clk_by_type(core, clk_type);
> > -	if (!clock)
> > -		return -EINVAL;
> > -
> > -	clk_disable_unprepare(clock);
> > -
> > -	return 0;
> > +	clk_bulk_disable_unprepare(pd->clk_cnt, pd->clocks);
> > +	iris_opp_set_rate(core->dev, 0);
> > +	pm_runtime_put_sync(pd->dev);
> >  }
> 
> [Severity: High]
> Could dropping the OPP rate to 0 inside a block-specific helper cause issues?
> If multiple blocks are being torn down (for example, in
> iris_vpu4x_power_off_hardware() which shuts down VPP1, VPP0, then VCODEC), this
> would instantly drop the global controller OPP to 0 when the first block is
> disabled, while other blocks' clocks are still running. Does this violate DVFS
> constraints?

Yes. iris_opp_set_rate() should not be called from a per-domain
functions.


-- 
With best wishes
Dmitry

