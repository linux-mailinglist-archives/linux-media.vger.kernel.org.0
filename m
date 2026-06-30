Return-Path: <linux-media+bounces-66136-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id izXzOYUjRGojpQoAu9opvQ
	(envelope-from <linux-media+bounces-66136-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 22:13:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6AB6E7BD0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 22:13:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ESIDl/GQ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HHGLL+Lo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66136-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66136-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 414BF306A158
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 20:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB17472764;
	Tue, 30 Jun 2026 20:13:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED0239E19A
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 20:13:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782850431; cv=pass; b=uRaecnSypEH+1xPfALZCWGZgSOohMWmiMNq8f1F1ULhpUHXUfDecK1on4vMS26awPisME0DfRlTmXmW4fB1DHIc4ApslN37lwgWtJcSW6eKEtgfu1wbtfH7ZhLdm3WICCAZ74jCCS3Tsd67t2IuB2I5cKhkw5qNVji00I8LQgCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782850431; c=relaxed/simple;
	bh=8XWfJ6AZS7OqH9L5OWrcIbFkTMgk5M1eAT90dgnAyjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tt/uYGBLNZvkWMyxOi0gVkzmHOA9tYqcVi4rMN5AFYsFaJuQxPCLNaZTLwthgm9GV8bkLONmy1cGwc+Grx1Bb5UucGoEoNkhtHA6v3Ay6qZIOki9kL9pO05ByFw/awWzV+26b8P15jfCZ9vUBs3quRVSRdb1RbrjNqGQs4/u3G4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESIDl/GQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHGLL+Lo; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDppn2947914
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 20:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Br16D/RAGo5usqevehozZKrx/1lvyBeivnr5ZZqWWx0=; b=ESIDl/GQtCH4sWSV
	SOHM5DKxf2kIsu/WgQH5T/aF+MHWJek/blvQkwSD22xDHtM8zeNej7olRHlXb3nw
	T7Mzu4UMrE2J9abTQ40HfRJs5NKblaIB8Vpgm+M7mqzUAonDvkxd0GxEwh/umjb+
	V4y23VHYry1DQpU7OcOljoHheUwTUp8fjGPmviHED8XdZ8VDOxzr/Dq6SAdL1m2a
	16JoCI2MwA7lKJD9WHSrSjFT4jH+XAxfPzE2e/92Ia8cPFPYCb504HkGrgP8PJbz
	ze8TJmV0X7++L7z0g9XHWJll9VBeaLDtpnqv8n4seZ/Wof2741byoH4hGGlD7qnt
	DhSeig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0as6he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 20:13:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f1d3eeab92so31372206d6.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 13:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782850429; cv=none;
        d=google.com; s=arc-20260327;
        b=iaGkJA85WWKPAqfcR4AgIMsZmcaZUx5Cty4zZtEYC0JvnQIl+LPEO7qqUB4bKqK9Za
         z/BKZTuBSbS8B8uZKTAYTNyWVlCzv8Kvwk3ikuH05481WUz0Yr8/tVgt5o7BAdd3uNdX
         6KKcxzkyRdCIoTb1rW5BDCc1NyVFojbm40nni1QfjlJWJQ3QC3YCyeQLg2JyrEtfyHGS
         12gX4KPsTWQ329LzkeCoJcwqfBghatn+w5qb+loX/XcbhKrSacqZdOlQGMwQiEv/AJhs
         Ct5XbkrbuirxqDvvNPAJ1cMF9xYjggW0W8rm2X6q6QsHlJ7kfWxPgoBc2cNJE7xsIbHg
         UiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Br16D/RAGo5usqevehozZKrx/1lvyBeivnr5ZZqWWx0=;
        fh=hjiqoDT7V9HXKAt/BvZolALt8QK0yPxxUNSgtyoqrEg=;
        b=lY1dbM36ZzHWxmlX25bdiVQ3o8B6WZJ/z3TFhoZY2gInDNhAs19vHU6iZMpQsoGJYV
         25UZXpPF4X7T0f3lmG0yTK1dd3clSKEf7FIGjjbEu9E40+CtZqExjCGWhA2AwaipH3sD
         nApYSGo8UJ3KzouVvdVoyjGebH8b70l/343YaWUBQIDlr94+OxbD6Cw8AHoA7h6hNhsT
         hfkPV4EuT1+sq4nKuA0c6KfS/FdR+WtjWNw7rC/uUGD/9Tlz5hW78d4mYFBx1ztFEYR0
         ObQXkk56yaj4cohpFeJQ25UYyddieV/CZbFJDfTJ8caZUuo1yoWP0U47dr2HYDoYtbtT
         ij0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782850429; x=1783455229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Br16D/RAGo5usqevehozZKrx/1lvyBeivnr5ZZqWWx0=;
        b=HHGLL+LoURURRdt5s21JcC8xGqERPpvF7XzhKXukn1OhMsYYkGRkL4/aHKBd0wXxi1
         5XHBW0VtFzKv7ag0xRGex0o8rLlSZca+uCg2eRshlEFgOpoqL8YjdGjjZuixKUy3ZKa+
         CELp6cstbRpRgrlmXvIeu/n64emw9ZWBjGTTdCx3OwaSkt0WwQbuMtrEwVysw/Jj4Xn9
         Jtli3bq5yDS1OvaMqjdjqH+hFkJd27R/xiSLs+U1oPBaXcS2pvUhsrdb4kKDflvP5upp
         Z4mwxi/IhqnTHIzYFrkOmIebAH4m1oTo/MjOTFDpuK8XzmMHC1exUEiEECJsCjAq/Pqn
         HiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782850429; x=1783455229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Br16D/RAGo5usqevehozZKrx/1lvyBeivnr5ZZqWWx0=;
        b=ZI5OORhJBU4HUbQdehTqu4W011PdEizwNZ25gqLJAlnO/5AsNJanEzjKnJg9a3mJf4
         DsYXOuGk4A/CK0YgA9o0G6eNLAgixo5UCJ7JLyeRmrhorOZpdSjJ3xlaC5b7b+QS3WmH
         JuhTvKCPu4iMt7M++PM4O2kOfeIrPItr6HKgxn5UtHPAAl41VShanB3aYtLrF9VfMEP7
         9a7DRu0bAisBaiZdXJjlB5RZ4tSwb/udFU4LWm9Tsl2uaAlDua/T3JjTq/3GCoCC5wcJ
         +ZbnsYUmLe3dRNnPemQkUiqksPRwMEodjlnII1t0EgQAGtIactNIeBaQbtalagzTYn5a
         NqcQ==
X-Forwarded-Encrypted: i=1; AHgh+Roxcvwo5QhL4MO9q+/xGMtmdPGAjGApUoBVfqMfxz/jt+SZ0th1ajtQU81I8BN8eek+A8xqrBFUvQV9zA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ldMfRYtuZcqYWmbarGNSh8B2RxBBChGNVe07T547Zn/ajuV7
	48rmesqq99pgF6JFxKxxKwWFf0azHY8tasYy/sg6HxsiWCceNGYLbiRcqmbGAhJFnyPU22iQgmI
	IUZiVdCMUjoJ+D1QB3m9iXQXwyLido/sWCH5Skcs3VeFfxtgyp85FC0QHy2/6ZGV3DFahOGQdyW
	5XuSseIMP2aKD23HzIKVZQYJL+dIKTWZVNkTVof8+Y
X-Gm-Gg: AfdE7ckfUJXw8TiGuzNIzNQnN1+ewD85CTj9jexuLyko0konIEbixq/DLdF2PnbBNRa
	9PitGfxZLxBPqGrsnbVuW+ZT5uBENpFUpPbs85ys99xJ7QOLzT7dOxg7byF4LK2UNcUwJotWmlZ
	Idw1xy0NHbJIqgum/p3muy0um/AMW5yTzFYRy7HyR9MKBi7I/Da+iMn0HWybzAiG2zIq/7mFo1w
	9/hFT7wzsXBG6NizDtqu77npdPjizVL6fsH+xuw9NjyS4vy9Pvnp/e8BOxMynsMbaByR8rjl16s
	xrz9iMILJJ4=
X-Received: by 2002:ad4:50d1:0:b0:8ef:a219:35e2 with SMTP id 6a1803df08f44-8f1b92488cemr58135096d6.3.1782850428637;
        Tue, 30 Jun 2026 13:13:48 -0700 (PDT)
X-Received: by 2002:ad4:50d1:0:b0:8ef:a219:35e2 with SMTP id
 6a1803df08f44-8f1b92488cemr58134646d6.3.1782850427954; Tue, 30 Jun 2026
 13:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629214618.2523099-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260629214618.2523099-1-Frank.Li@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 22:13:36 +0200
X-Gm-Features: AVVi8CfzbLIbtv6dSw-7FsFdEOVU1ktw7OdKOnAZu0zxtAQiR_VtFyb4lJjXlDs
Message-ID: <CAFEp6-3FTSaxaZdHTjw8-tt50QKoVd+SiQHt0Mrw=c2p7vrA7A@mail.gmail.com>
Subject: Re: [PATCH 1/1] media: qcom: camss: Add Frank Li as reviewer
To: Frank.Li@oss.nxp.com
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
        Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44237d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=ZJ8Py5Zph3aUlVnHwSUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=ST-jHhOKWsTCqRlWije3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8T6enUw9LjwyBjEzaz9EdST0dHrRiZp-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE5NSBTYWx0ZWRfXwr5qS0JV2Le2
 EpGvlPQUj1Gl1KNFlaUMszxvP90HkXM7ecstHBxZaFk6Z7+2+M35YMlY8hZ5mQyUrfo43QqbTyQ
 AXk3nVd4QIhWveaMF2UZneSSIcbB1bw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE5NSBTYWx0ZWRfX+NHYnRdLnDfz
 4bEOvliMNjtngJXNlegaRkLl7+SNW4gHExlSkJgvV9Pa/Foi5tRRePnyvVq8vR03EypMWGYiR6Q
 ma/hVwduyqE2Ns6b0++8nS4PjD9DltMMVplAcH2Dtwht29P+v6Z2Ul1u2EC9j2Di07xQJrDBT5v
 psXHS5l2nkNquvZgU4ojZQJnfAu+U0n/NNvvsjJOA4DjPuROfj2rMnPQAhp5yMUOrSFhDSTmKf4
 yDazODj3aDqHULw717kFOXfT1qj78r0UY56vKJPaoh5h8OuJPG2tvj/aERpXmHsEl7lm5AUaKvw
 rlSimmUeY6N+Hj0jgn84Fpy0pWpYPeL9/NXF0qN8BccGCQeVcHnKB6CR26JBRVzZd7hUopeFWSc
 7eJ2m88nxSPw29y9hWs8EyDJZFh22Pg2cnQiSm/1l1fnFM8d93y3b/WBKK+2PMXCo4U8M/ETp1m
 t+P1FtA0HkFKyYIr7Ew==
X-Proofpoint-GUID: 8T6enUw9LjwyBjEzaz9EdST0dHrRiZp-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66136-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A6AB6E7BD0

On Mon, Jun 29, 2026 at 11:46=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> During the 2026 Media Summit in Nice, a discussion highlighted the lack o=
f
> cross-reviewing between maintainers and contributors from different
> subsystems. Laurent suggested encouraging collaboration between the NXP
> and Qualcomm media communities through cross-reviewing.
>
> Add Frank Li as a reviewer for the Qualcomm CAMSS driver to foster broade=
r
> review coverage and knowledge sharing across platforms.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 34b8dff9bd69b..361a4f447277c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22114,6 +22114,7 @@ QUALCOMM CAMERA SUBSYSTEM DRIVER
>  M:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  R:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>  R:     Loic Poulain <loic.poulain@oss.qualcomm.com>
> +R:     Frank Li <Frank.Li@kernel.org>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/admin-guide/media/qcom_camss.rst
> --
> 2.43.0
>
>

