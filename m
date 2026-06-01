Return-Path: <linux-media+bounces-63278-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPknCiagHWqncgkAu9opvQ
	(envelope-from <linux-media+bounces-63278-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:07:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5A4621571
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 341643017CE6
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450943D7D84;
	Mon,  1 Jun 2026 15:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRqFYGB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amJsCmDn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941013D79E3
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326274; cv=pass; b=jiUIx6Uy69SDbf8KtwqqAhW00XRc4o6aTJjpuXDdxyaXwg/cc+NFiBi7znDoK7xmlqejKlKkYW2YB5Hoa2H+DgY0Wy5jfMs18BULW6lMYYKmlZajbLcEoeRGlZ4EgqcgZr6l+/SRjwcCl94en5Zkw5ZB55ezgb6nqIBhtylKZ2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326274; c=relaxed/simple;
	bh=Mp60gJ55zo9v3Xom2jfl8sCdLl+dNBb3b7eef/UakmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaQVy5IKHdIs0Rq7T9GQtOyGcRfmXLbO8vHI4n345tn2A+wk2JZb3EBWQamANtOFODa3pnO2pp59oYBMAKsyYZcuxy4R2rKlBMzs0eqDA7PKDKYjYW120EoJA33qzemjTBng7EKPMASc96M0PvZBbShlMIk0HSJHJ+SJhFalcSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRqFYGB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amJsCmDn; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EeBGU2740401
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 15:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TniDMWPlC5wJVCKXeX8vLCzRav1MdaXlzFFmaU889I=; b=YRqFYGB+4FypsnYO
	TRl3tBiMCsYeT4GesNcXs3gpR/la+dLrGP5tmmOOc1htBjljzs+so4Ngq4r+u0ny
	PU4zWUeRpSbzURkIu7RJGCUB4ABe/EZlZYyDsgVSk2iZZMuAcOezY20zBHb0X9EY
	+/FHTa8uISnaO2D4O/lsz6LgNZ8TOgBDIHa0riODqBMdEAnNVvmx7cyUc79S6mih
	u9Wpxmi3XjejkVAi2voS11s88885vR09F2TO1EvbyroGvidLYa9+4EK1k9XgduRQ
	czdcT34xqcDy65IguEqXl2LjAx+Tp4PkCcVP5RsESoORjmJ9r3oVUb9pbieuyuK4
	TbPbRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqhm5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 15:04:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915767b341eso26991585a.3
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 08:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780326272; cv=none;
        d=google.com; s=arc-20240605;
        b=DawZxZXQGLurqbblg3im+m/ghK6ZwXw9HrVKs6cqd2mVZmaWx4hQUp9dYQ2QhOlI4v
         T4iEnu0o4TCvGRK8XceAOM4GrUvppqBC8W0Gg9iddsv1l7gmXAcS58xnP6TI6jvuZIhW
         Qj56w6SmtOIEo1/ozGU9Av0/yOrJ5YNynG3fe9XdZqpXecC/CNz+B85whO0NIfxbGk1q
         8tqLrizjXl0aMFZeD5+6grNFnOY0dxsjZmi+MtqHPtr04e0TdXsUhe60da3S5rLcxyzM
         +zS7cNjTGHGhYQwPsTIZOib/Nr45+5T6za30c3S/hzhJioEKXEizDaaK+TQR8qTZ1Qtb
         w+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6TniDMWPlC5wJVCKXeX8vLCzRav1MdaXlzFFmaU889I=;
        fh=ZqorUD0A9XkA1lsJglInFDkWDIYMFry6v/slc1qRsyc=;
        b=AxhcKsKoC4Sw+2j2m6ajKehC0H/ZSGjhajOHv3Z4J69YK0vZys440RR6+Z3MZgpMe3
         2NTi7l0pHUxDsmc145T52EUEzO5eVok6lZl2LLNqB/3qgdale2ywChO0iOWdHo8QcUwd
         r6ImoTdzKjH56o1ygchC6iOPuuR5jfOedrudjwoK/UntjygwNwCztP8oHLM8fGPzKwMe
         bXh/jduiVf34JXniy1cyNGxejxY/gq7HGqbUPcgWAopL09hbq5TzlUWJDs7dM3JAEoSK
         qodvBAFFM+1312rOoEQjIreaucKD0TjoSSjHJtuOj3WeS9+LAIT49jgkgiQtwG18L6xh
         ILFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780326272; x=1780931072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TniDMWPlC5wJVCKXeX8vLCzRav1MdaXlzFFmaU889I=;
        b=amJsCmDnqKN05q6OstVd08lQerQjQNn94+wVmyRHZc9HaBsjbCqC7FCgy1b96PsI0R
         LhEL0moTyWkGI5dwE6qh+rw6mkDE6kUU4Q/0scr8jZzMGV4R3FkFCo3u5fxxx5XE/9i8
         UjhPLcajR5d9rPQ/HGke0Fe10yXfQfNRCBjx4V8G+J4gzatByvpTv5K8MJQcbhBohwXj
         wpF113Kf+3Nj1bkMNxlGJ4uwLJlXN9+zIhUNIPLVIHcxohCJHKjPr3xQbeNuYmn/BwIo
         uPAkk+NB422o5fK6LPYTElwx/M3CE+geTanR5gBOCrVLG+0F+EhnU3g88jZIofKzfiQX
         Xwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326272; x=1780931072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6TniDMWPlC5wJVCKXeX8vLCzRav1MdaXlzFFmaU889I=;
        b=KFQ27FAJcBlLKRuQUcWmqzgH/bGFWxOc57MbCLyLH7Hgutslxf2anwpzt8EL3X0Tqm
         OrLBcEIrm1B5j/D/p+3hkde4sLG5A5lsjOQj932tBf2vUepwjrrb2qPD7b2yvQayiZYd
         ARiASbO4it+KCUwykHxj+ymqaOP5dyeXAFilWI5vX8G5KetKpWErC1VrNijP/QycTgda
         5IzSz3TKRX0VDg/pLcDoDELozZL7zudg326zIQUFz3F3M2gywZ2XpEIe2XPQW6QQUOnI
         AiUNuQ2kO/uLJks8vs/dZMYec/ukSPdjt3xsZgs83xN6bIOS3MwHZmdlGOryCua7IJNo
         692w==
X-Forwarded-Encrypted: i=1; AFNElJ9ZVbfx9ix6d+kFqS1p8xR+I4t0ioOkCpLwxUdbR3JmhckoqGk/nDHOb1/xi8cssiXSnmOoSqKY69xuPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9+KNd7Pu/j4WCMxE0i7lKnh1fc4VU8b7yYt8Z6xHn4n+dpIwq
	Iu0KW0KoT0mZubZkMcuNyWwxli6Ns6EMzdEzsnA3KTWKZsQx3ccT4dSrDf9hzhIaNfdvGiAVxHH
	m9/3kKrKcv53dFZrnAhGnxBxztHZ13wrycAAy9YaOorXJ6f8LepjpxmPghv+dCCgUmJAOf0XERq
	QLWndbCVKNZxZ9fj4fiNskLmrr52uJaZLbjY4NFqus
X-Gm-Gg: Acq92OHU3H1reXSKWEX7UaatqZt1VqZMMFPtbnSRRA9KBza02DE+anAyWuosfgGFPBz
	oduDi/jELRfjDqVo0VgARhLSKTiarjKWONK9NfdtiR+N4Hb8f5eglNqpcIXdE09HZNCOogw8lzX
	Af0rlJIsI0PwRr6/aelReZUgDhsCAAQyCxHUK+Os/WFOFPJzYBB58J4woewCDtt0+1cjl6XkP1s
	6VsqnxWWFNzOZaJqj3CODsxVkrzo24GfqUsSZd9b2F14LI2+w==
X-Received: by 2002:a05:620a:6f05:b0:915:673a:61e9 with SMTP id af79cd13be357-915673a6392mr539173585a.16.1780326271716;
        Mon, 01 Jun 2026 08:04:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6f05:b0:915:673a:61e9 with SMTP id
 af79cd13be357-915673a6392mr539163785a.16.1780326271192; Mon, 01 Jun 2026
 08:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-camss-macro-v1-1-cabf1fb99241@oss.qualcomm.com>
In-Reply-To: <20260601-camss-macro-v1-1-cabf1fb99241@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 17:04:19 +0200
X-Gm-Features: AVHnY4KYMxjyyMWv1Bu50VoFEOCEofBd1PrQpAowlfJQ4fix9OAfbKu1CK-FZqc
Message-ID: <CAFEp6-3a_ZRvCBiATwT594KOMH3DOMoQA_=qj0WW7iiZHTWABw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: csid: Consolidate CSI2_RX_CFG0_PHY_SEL_BASE_IDX
 definition
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: bXN6MT6dPl2UXeqe-2DMjIlCJexEXHgV
X-Proofpoint-GUID: bXN6MT6dPl2UXeqe-2DMjIlCJexEXHgV
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1d9f80 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Wyjbxgov4yX43DM-SYUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1MCBTYWx0ZWRfXzJvxN3TUHEx7
 3PoR4RdOXGQjGY8/R8mNs15ZyDJXltTz8xUp3ThTK4auFdoCI9TotCG478RGwOcZHOXGNQGvQ8N
 JDEbnLua6W+oBypArO7hDhKMSLOUDmewFQOAhgBLVmO6k98/LRUPvDxLQFIm7imN3OtuknzWKAV
 myyhQUPLL6nybnCcZFk7Z3bmepMyd7k/TDTsxuKiiouboMAMvhx9yd9VOR2tfnxn36MAXL81QUC
 qIU+5YB9BxP9Q+VHVmjNtsONDwTRFUrJFbzaLLkSMMp7p2GWm0nSprx1/AE/jHjk4npwgrXBeJw
 aNLmMjFR5u2mswwmHZcZShUlFg4gSMdZWOQONJn/lTKJYJv7WMRFykRzb9BW0hN5GWUQIoIyiUP
 u+o8Ps+KGO/ykleWNiTM5ICeuZm79dR/PL7BboAEsKgOb41r1RRTY9XNa485mrLTze1c8WOqMK0
 ziL8kBQmsmnxX5MyTYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010150
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-63278-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 7D5A4621571
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 4:44=E2=80=AFPM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
> camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
> header. This eliminates redundancy and makes the constant available
> to future CSID implementations.

Taking that direction, I don=E2=80=99t think this is the only instance of
redundancy, so why single out this one in particular? Should we
consider one-line cleanups across all similar cases? Also, other CSID
drivers follow the same pattern but use different identifiers for that
define (e.g. csid-340).

Also, introducing such low-level, register-aligned naming
(CSI2_RX_CFG0_PHY...)  in what is supposed to be a generic
CSID header doesn=E2=80=99t seem appropriate.

Regards,
Loic



>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
> Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
> camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
> header. This eliminates redundancy and makes the constant available
> to future CSID implementations.
> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c  | 1 -
>  drivers/media/platform/qcom/camss/camss-csid-gen3.c | 1 -
>  drivers/media/platform/qcom/camss/camss-csid.h      | 2 ++
>  3 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8fb94..bf7164085ddb 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -101,7 +101,6 @@
>  #define                CSI2_RX_CFG0_DL2_INPUT_SEL                      1=
2
>  #define                CSI2_RX_CFG0_DL3_INPUT_SEL                      1=
6
>  #define                CSI2_RX_CFG0_PHY_NUM_SEL                        2=
0
> -#define                CSI2_RX_CFG0_PHY_SEL_BASE_IDX                   1
>  #define                CSI2_RX_CFG0_PHY_TYPE_SEL                       2=
4
>  #define                CSI2_RX_CFG0_TPG_MUX_EN                         B=
IT(27)
>  #define                CSI2_RX_CFG0_TPG_MUX_SEL                        G=
ENMASK(29, 28)
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27d..da9458cd178b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -105,7 +105,6 @@
>  #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)     (csid_is_lite(csid) && IS=
_CSID_690(csid) ?\
>                                                         (0x34C + 0x100 * =
(rdi)) :\
>                                                         (0x54C + 0x100 * =
(rdi)))
> -#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX  1
>
>  static void __csid_configure_rx(struct csid_device *csid,
>                                 struct csid_phy_config *phy, int vc)
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac..059ac94ad1be 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -27,6 +27,8 @@
>  /* CSID hardware can demultiplex up to 4 outputs */
>  #define MSM_CSID_MAX_SRC_STREAMS       4
>
> +/* CSIPHY to hardware PHY selector mapping */
> +#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX 1
>  #define CSID_RESET_TIMEOUT_MS 500
>
>  enum csid_testgen_mode {
>
> ---
> base-commit: 697a0e31ee66f5ddb929c09895139779fff33f20
> change-id: 20260601-camss-macro-3d40c4d4e90d
>
> Best regards,
> --
> Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>

