Return-Path: <linux-media+bounces-60594-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEV2AO45+2nUXwMAu9opvQ
	(envelope-from <linux-media+bounces-60594-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:54:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA144DA904
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A2EE30570EC
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3636F43D4E1;
	Wed,  6 May 2026 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cpasl/dB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iK0OJn8r"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6311E3FA5FF
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071816; cv=pass; b=HHwY4RpPnbos/KxyjKY334Dei00CbZlVV8CdKoQmZ88M+P22O2a5VGqdrzkMfZH3mLDGMZFc0kD8gv1x4p5uqNwLcpas4xSl7ICNLQzM59Gcq5o7GOCwKJ5ifz7czzZtu/VBHbKdt/ezhr3B/wKV7mG1+cTJr75Rpce3jk/UhBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071816; c=relaxed/simple;
	bh=mS8r+S9pwmLKoRAaHK8MS4UWAwbGG4zgoB2kyfgCpJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j262B+Q9usj+UFt0C+EU0u/TSN/MHw7K5tIIutlnFM305yuwjpPZlxs5kfq4UPfjT5RQm6KB+r2AYz3VG8jgHi4fn0wO28u2Jrf0ZSuMlNTCKO+olx85PxshPnwz9BTrj8bzSviZdalOxwj0/pnQGp+6ZHr7ikNtOsx6Z8GVZ00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cpasl/dB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iK0OJn8r; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467trPo2427900
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 12:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pr1pche33PBNlzUR0xWQRPtHTU8BxUSRKmofmRzZmZw=; b=Cpasl/dB+mNRW3GP
	peHL08s4IXVWZLRtwIT2Ruw9Tn4FICbvHwetrFzDhPd+NtkrFvlaO1CPiw8awhZz
	JnEck7fEUyJzO4xzTVNHkQmwZA+eR15fBJeCbL88qeZxxpkjOGEMCNj8Klc2OfzB
	LuA6RfyRgePGUARUhk8DsumoFtJFfek4l5X77T91mYh7l24DPpU0xx5kV0JX7Ccc
	5ctM8r949dYlO3xqLGsbTEWLaglEEyNSs0HFE1jo4X10pO5SZDCPRYA725dGNH5W
	80dCj+i+dV6wgXvZzvh9mRxYMe8p9KwpdENOqsfb09exq9LDFF99n0qJTrkduEnN
	qXVtDw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01ph12qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 12:50:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca172588cso158277386d6.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 05:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778071814; cv=none;
        d=google.com; s=arc-20240605;
        b=U3W+TFz18NrGQUfGv+XOUAHyl4gvHT1M9bFC4aDS3++y57ljhlhUa8F7DpUyzvr7mw
         Urh6mSsGenMON5y3MyneUpkhpqNnnMesOVgnR+VBaLU10i+wOXs4G5c3aFFM8byAteBF
         QgQ0atJ9mRpdwf0PjThM2nUMzCTm04Fdcj5GBKn7tNDM88zmTXnO4/Hg+2hmD8y0h03f
         2wq/ZPu1Afk7NaNI0e5IBH/QGrTiZTturTl/sGcxdKTB8UMbOpmOxptdClRauzewqf5P
         Lk++46IcostYen2Ww+oXVjujKx6QydB9GMtLNeVMbMNXsN/KVd54zvaF1X2JXrxMAL1h
         /9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pr1pche33PBNlzUR0xWQRPtHTU8BxUSRKmofmRzZmZw=;
        fh=eZbmZ32zQbOQpRh21MbiJueZskuk84NZj135RuLpvCs=;
        b=VW1LnqesaLIZR+T8oliPwE+eldFTJH+NuxzbEQQXryKXh63KlVCcnREXEs6Jw/6uuL
         ON9e3PyJCYLHjzh8OZd4g1s2IApoOgDaWQ7Q0th2jxV5eF76JVBfejG0HjldadsAFk4/
         5GaChtNpBC4rpYrq+W8MC82CXAvkVyWQk7ua58I6juNQIDJDyBkfzNCFcRz3E02qwgJ+
         hd3AFHLWC3wePD1RUpB2ZD2xqHZ/9V6eU4gziG0D7e8D0cV6PaWnlcgeZLdLVY/tWLgY
         MhnKBqJUm7t8s0wW8e0ETuZrYO8yk9THuzsFmSgMqxTMZgpTlNUzyy6JrO1uoXOnmeth
         p4fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778071814; x=1778676614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr1pche33PBNlzUR0xWQRPtHTU8BxUSRKmofmRzZmZw=;
        b=iK0OJn8rkdb+no76HC6aUCrBVkvjmG0b7RrlnDKD16txkfQaXCxWADxBZB7GPBdY0o
         mkySpyx7gI4lJA8CjXairPbH+q2QNDZnzv5IUU0hbUSAz1o6FIV6zPexzxJ9GwTnFdCg
         xUawNxz6wnKoUg+j5yRVrrSAC3Tokz30PbYJS0/n+Yo7M53tZXb6vdfxHIXK0B6OwkNo
         bXt91GY2Uh4//7Fm49C6lfUu3Id4juC/e9xw9GzkCqJtvmvBUaTYgQjIqAfNN5GHWhZt
         I1qeuR5gzFQl4GJB2Cl7/JX+eJVULJ8trVg3U6qOCA/Z2NYVwMEsw0t5oyudU4H0pd3J
         /l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071814; x=1778676614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pr1pche33PBNlzUR0xWQRPtHTU8BxUSRKmofmRzZmZw=;
        b=lqFqfbqkSpCaTkUFqbE87G2CSOI8VX499Z6Xw3xiUQZPzq0Uhc8tyHcNfod1JlMjZ5
         4BPSDfkzjGnoAkVqN6NsstDZq3J6XmHQC7kpj32SMH2VvTfKOMLq0GoSkWwPuFTrDOVA
         hxti/mW9kuIps+la8vH0pfhPeF1MVGbA9bpBmmtnK+7GcfZI4Pc8SLytD9JgZpo3BoeO
         9EU9nawodONXOcCLDHVX4Zczcr++EW7zRyOpD93Y50Qs7Ek+9DzlVmTWUuEz24FCd0p0
         hFoOYoBg1HYQzPuFqwSOQNCGV8wMN0KP+Vl3W/RJ16YxVMUUX1AEkqPaeCkwHKkV6Vch
         nMbg==
X-Forwarded-Encrypted: i=1; AFNElJ+mgLrOn3VndL+2wvpirJA3Gf8KN/oAFTyfAAtt4Fbvntahea6UY0UFNjiYNPhpSyjeU0YRQ2VyAmYCjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSnkQPwJhEHVKgGU/iZ+7Qj2krnV6CEIdgEWe4gm/xZLQp862P
	IXmh5R7gjbgQGENwlUyU2yppk+XPbJ/CBxGJzW5ZzqcRd/Fks9zvcwd6GlSfgSbflC2GDkmXhEZ
	R+2JOX1RmP39eKyet+FJsDkFthDVqERAF5HuIvX+wudRUUrO2W14UHK1eNqNA+npyFv1SIAzlcK
	2txBm19eZyMsZiReggr3VJbEAVDWMC7VW+RRAC5oC2
X-Gm-Gg: AeBDieuFMmpu5/4COYcZo3noy3dgL383+FTFgI+ei0roiV0/eu4Le4QgPCNPtffLP+L
	Ca5bWwv5JLxuEhrP+KrvliOBZHpPPWvjhv99KZNatSaLFJIZBXnocKwTyf6vXRwJ1VYRu65OzS1
	0x3cBOFjh3jPmcabCM1VzmjJsI5AV8uWwKYeLV6osFfvyp84Th3HWRd6fvOBhV4SLK8A49b34or
	IPClHqCBV1FBrm21YJws6xXH7otiOSfir7JAnNiC4+W5MX8dkI=
X-Received: by 2002:a05:6214:4589:b0:8a5:104b:e385 with SMTP id 6a1803df08f44-8bc45e1f618mr42954256d6.35.1778071813628;
        Wed, 06 May 2026 05:50:13 -0700 (PDT)
X-Received: by 2002:a05:6214:4589:b0:8a5:104b:e385 with SMTP id
 6a1803df08f44-8bc45e1f618mr42953566d6.35.1778071813020; Wed, 06 May 2026
 05:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-2-f430e7485009@oss.qualcomm.com> <c145efc2-9285-4e2f-a9e9-73c4faadf15e@oss.qualcomm.com>
In-Reply-To: <c145efc2-9285-4e2f-a9e9-73c4faadf15e@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 6 May 2026 14:50:01 +0200
X-Gm-Features: AVHnY4KyfxMt2VrjFb0bRHruVPCpaFG41raMk7S3fQl6jlpOP3lRjD4NH7eqmGU
Message-ID: <CAFEp6-2pASEmD1CrOpY6BpUHVLWgtPuGRsMYHFZ-GgUKy9EXaw@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEyNSBTYWx0ZWRfXyjbQZnBo0gt+
 AKDL+LvocD3T3FmGpHm87SfHqo4gV5XORepvX5gNdKnK7LMNqv1kJPafviu+9DtpW/goEjTv2xt
 DGGQAhb0VovC3Z23BzwymUZLorMwdlcaz2SsD96Bx01e/q1kIxz2lY+80sFzo7zLyqA7UMaD+Dd
 zKf/3sgjImWCGGEg+tRoQdw8qhEjjmCMBkkZDlzGGxPSzQ1/mk+uWqHPguMmzXTu6FpGO7ito3D
 6WYj+9aBJBv0tjjujgtul71PBV+ZsnwPSbXLyuAxpIxNasFKVJxhHHJjBkzNuksN8WhAvhk5wKG
 yVW8zT3URIp7Uqzp0VUrOFB/QPH5wSt53IZ44qvMANshTrg7vYnVxYW8xdEyFv9lAGyEFZnw98Z
 TTSEH6hUmbhyuh/0LKQ0DmcgY9nFHy2WbZLIiYmmKVuwQDElwMnYlrI6a5SEZJK4ugJ6L2V8cCT
 l0ueLJsUr6J5T8OZ4Gg==
X-Proofpoint-GUID: yK5-IVnGPSpWh4tGXm79TLFTmoUcUZmh
X-Proofpoint-ORIG-GUID: yK5-IVnGPSpWh4tGXm79TLFTmoUcUZmh
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69fb3906 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ZQv5F3SHT4vI6nyy_eUA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060125
X-Rspamd-Queue-Id: 7AA144DA904
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60594-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 4:04=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 2:43 PM, Loic Poulain wrote:
> > Add optional PM clock support to the CAMSS driver using the PM clock
> > framework. This allows CAMSS clocks to be registered once and
> > automatically managed during runtime suspend and resume.
> >
> > This is especially useful for global CAMSS clocks that are shared acros=
s
> > multiple CAMSS subnodes. Now that CAMSS is modeled as a simple-bus,
> > these clocks are automatically enabled whenever a child node becomes
> > active.
> >
> > This avoids the need for each subdevice to reference and manage the
> > shared clocks individually. A typical example is the set of clocks in
> > the top_group, which may be used by CSID, PHY, CCI, OPE, and other
> > CAMSS blocks.
> >
> > Introduce a small PM clock descriptor table in the CAMSS resources
> > structure to describe clocks and their optional rates. Initialize
> > these clocks at probe time and delegate clock ownership to the PM
> > core.
> >
> > Hook PM clock handling into the runtime PM callbacks to ensure clocks
> > are properly suspended and resumed alongside power domains and ICC
> > paths.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +     for (i =3D 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i].name; i=
++) {
> > +             const struct camss_pm_clk *entry =3D &camss->res->pm_clks=
[i];
> > +             struct clk *clk;
> > +
> > +             clk =3D clk_get(dev, entry->name);
> > +             if (IS_ERR(clk)) {
> > +                     dev_warn(dev, "failed to get pm_clk %s: %pe\n",
> > +                              entry->name, clk);
> > +                     continue;
> > +             }
> > +
> > +             if (entry->rate) {
> > +                     ret =3D clk_set_rate(clk, entry->rate);
> > +                     if (ret)
> > +                             dev_warn(dev, "failed to set rate for pm_=
clk %s: %d\n",
> > +                                      entry->name, ret);
> > +             }
>
> So this makes a couple fragile assumptions:
>
> * there's only one "on/operational" rate
> * no OPP votes
>
> I would imagine that in the camss-is-the-bus model, the top-level
> device would house an OPP table.. but we have two somewhat independent
> clocks that may possibly have separate RPMH requirements for their M/N
> number of rates, which could result in M*N-long opp table

I think we can remove the clock configuration here and handle it
properly in a dedicated place once we have a strong plan.
For now, I guess we can simply rely on assigned-clock-rates in the DTS
to set a sensible default (nominal) frequency.

Regards,
Loic

