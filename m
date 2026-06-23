Return-Path: <linux-media+bounces-65467-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OSIDL0J0Omqg9QcAu9opvQ
	(envelope-from <linux-media+bounces-65467-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 13:55:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 323916B6E7F
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 13:55:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Vvc/uqFU";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S0ojvVmf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65467-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65467-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FE53309B002
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 11:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEBD3D565A;
	Tue, 23 Jun 2026 11:54:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C893040D565
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 11:54:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215693; cv=pass; b=YibT4fd01O+0MsUb9uXR/crEp94ifOMpayyEPoz46HFCYDP9uvAd3Iba5WNzA2hyTM0F6prPftN736QSbiNRKJo1QcY0LdCFoUI2sx4euygKCih6cKBWE2Sy/zt1FdpvS0WL2/HyvbL2z1UvFDil7Y2zA+/xSD24mRMLESp2pdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215693; c=relaxed/simple;
	bh=RRpkkLa0W2etFg/RhsIv5UIlJlesmVn4cGN+MF0OYls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXK72oToWkTpL+eZqPGsLBeFieVK6dq+tb6OTN2eZN+LH5OxsWnNFSlvlTWVdZ3nGtY4leo2NgGnJWisWAVBk+UHvHHWz2pqLAWIxjIxuZWtu0MIBO0AuVy7QTQ+0+0RSMnIuPi45i1nz+cuVQR3kRskc29TEoCM5VHxDagMCMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vvc/uqFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0ojvVmf; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYhBM113463
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 11:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=; b=Vvc/uqFUHWTIaaHw
	CgykLxh+JHbckuAbxr8LVfoxnnIpUyBQj287laGknSqX7pOZSSLpGsPrSAYWRcS+
	k+H+i40QkYoQxdBykEvh5BrF6HyKN3Td1orFAy1o2bYjnSuwYjOwvcRofmktQE5k
	hMqVRmd0wJAgUGR1+zMxIcflbZlA5seD39z7St0Kbrike7NxXRQOmlwaK0X5nhTm
	yPe5OSX6oy6SXOyRLgdjXnZbsO/scPyawcLxVz2PGhOunTtpvEwhL1Bb0WBJqd73
	yNUIKOr3FoCTo2VwA5NNDjw4wW28XoaBUS9X7FrTqyhPI+MtMGKYDfZEQkulIne0
	+DOtnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvsb58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 11:54:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157f453a27so862002585a.1
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 04:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782215689; cv=none;
        d=google.com; s=arc-20240605;
        b=XvtBrSWGo58BZnvdN14jfxR77sBUIU+vhGfb9mbmsgnCNsKg+DPyqll0+LosYl8CAn
         WwEcIDnvOFrq6IIXgeM23tIEsdt9PTyxQKxbQ4hmJTSQGSloA+XnDgfiiEO2o/AbjSGI
         HlUg57WJCO5cgdOTo7WujzSJNJa30TLoGWw2Nqd1GgwSe2vK931Ii8qzUL572PkZZwzK
         yLoFbJiz6u2anO/IE82v/7+gO1XPuJMp5Pgkqj7j6fGOYYRVn9txYzOFRYvHlOy9KBDX
         xQujJlyYTwReL6GMJCl/41WSIVvkkpTv4WC761LOk90VriGFyWBw01K+Fc+vL4a/jdma
         gsYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        fh=oXKs08TDRuNFmGMYAKgR6dSlU7ivwvPSbOm4klHJyqo=;
        b=YGntwvJVYGOC5ZUfJz2Sxt8Pz37u8SHSXjF1umB5IVrwcb5ZH2lc7U3LhLKqMDFrKZ
         FMpjU8PCF3AE6WUW9l2Ntl7AzAnIRNH7EpMUYGXUse6K++Q7sy5g3qZizlPdQGxuV2YN
         9/UFdnur0AWjmLzUxgEPtBkXZrXZvlENJY4+oXd65255UQ6sLkoSoL2rTZQK/zTDfgz9
         xub32+zPzJ/47KxhumPc7u08quRu7GbQRwFKjFz2OtTzcGDs2G70OTWJ+damJG5t1DaF
         tvSvJfQuXgBA0x2gVWLY1cA74IyP3yvhdikQDQ7aXeTQmaP+zqMw3/J+0hCbMtDyaims
         kMkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215689; x=1782820489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        b=S0ojvVmfhtXj72V+zvd802umw2q1YHabvB+M1pAn7p0FkCXFhRfjdhc2M1i1vIoW6y
         4cCLGXQTosTK9XyDGKKkBLv2tb+xRXuOclf3Z67Shao9urJXFGZz6SjrvTVhfwxP1rwm
         W5jJDhHJhLWf0GwBHCQ5zRymUpMBULFtmT6zWBeaVYE2RbKozo3UFb38GS6aiYxZDVO/
         2VAFUzlh5txPMb83N+ddNWYn6eAL2EUhX6Ocpnzv4Qq3YI5xF46yXmNtgkF8FHSKXflI
         YpwBNUTu77VRoo3JbLRD1gZ9Ph6r6kDilhxLHsTUdZ3tolejXDWIbuqhe75nONkithgv
         OKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215689; x=1782820489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        b=igBU0xSOg+j9YpUSkmZ9ZvUbYZeioO8z/ncH8ntiWQWvxp0FbfQcnGNo5Fyj45ootw
         nJVGfDXBHisKoMkNnwg1M68DWVIPiQp6xlBw8SsMBZrHjvuRulyKaFKr5C5gKjK/uLdq
         HU27AZkeMDYmAScur3UfKYuVwJfaVxY3U9y8YvTjg9DlPH6y3zN21qGiPCmBcOcusg0e
         Mtb/zxjilVyZ4nTE+oE8i7N/4ud6olKGJFaMn7PF1BoJ3fII5FiMZ//dmcttvRAZMxzD
         zSR34jKRq6GOVSauPNFB1NpOM31nabHS9AY0XVLkV6UQABE8BKnVvSkQJVj0pt/arjMP
         mBdw==
X-Forwarded-Encrypted: i=1; AFNElJ8PGeg8i72qsxf3osJ3JDTxGmJf8kUIqt7gEH8nHrgwKFEtiyYLnGbtyDSUanixUO5zuX7fkdkdREADtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYPIpXFaVkLB2u6JyG/B4LXQinSJvTxsbyKfjIZfY16Ez/8Fog
	tefRIfY3frMRVAdDDVKTDpzN3kjs47d0MvEx1EXqYF8l3Kx7Ms1S33g/hQFh3xM7zgnNNHuBpd+
	lgy3TkDOCGv+rdr28uPrKu+JyteE0Yw6Un1QeBuKbwAKkQ6vvgp8QdAAyANgjnnTdWVSmYPe545
	Y01oxCaor8cSXzCy/djKSlKe4/x771QG4tkFy9D+63
X-Gm-Gg: AfdE7cljCcHf3nKOT0SPkGErFkuHE9ENFPVaxLcQNZc/YbIHSP1YmUBycAnxk5JxURM
	D1dFF0oZ1dbijz2h7KBQxOME/HGZB5IFuoV7/dvttBq2/cwmDWBsYejMl5s97EFgQ8egnTlrs51
	LvDc6LQYlOh0sOoy0TP6BXnMMOW0OtvOvE5AHWn81VGvc0MWn0QfUtkhoHc//EnMlLZxTKNsLvH
	9kNq8cnyWkdJ8GJpIG+vUBr2tExcm/SKN7FChb8G+0FIgeNcfIjSqeaHu0ppxsn3qeVFAJ5T1yb
	wuz9cWtlqZA=
X-Received: by 2002:a05:620a:6cce:b0:916:4a9:f35a with SMTP id af79cd13be357-9264771b2a0mr434707885a.30.1782215689091;
        Tue, 23 Jun 2026 04:54:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6cce:b0:916:4a9:f35a with SMTP id
 af79cd13be357-9264771b2a0mr434702185a.30.1782215688526; Tue, 23 Jun 2026
 04:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com> <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:54:37 +0200
X-Gm-Features: AVVi8Cdel5T7fniqHB4_fyyFIVPTxPRe8hWJeBKySDY3t80yH0us_4QRaPBT6xo
Message-ID: <CAFEp6-1vaeC9oDKuPAdPNtmGSsewbHRFS9RcPMzzzWHjnXQA-w@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped()
 to simpifly code
To: Frank.Li@oss.nxp.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
        Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a7409 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=9UnFPMSZPvWmRCPcKGwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX5JRbMdMXmzwx
 rXeqT/M8MOT8NVsrTU8NO0Sd670sGOIeDw8IqipJ3CPWDRDKVaHW1PU/RlVGgsu6Vn+PGJI8F5i
 pifWR2P81d8lUDIO07JD2kEI89pgs5U=
X-Proofpoint-ORIG-GUID: 3GjIJZs4UdruXGJ0f0BFxRkB4AK4iAi-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX6YyoRuODjANW
 aRUH/tGcO3v3d9Z1z0vXcGXXYkV5m1hjDdba8Q2tfqMn5Vzdga5SmDRe8Lt0TPS8tbbmEKQdlf/
 fOIFSz3OkGykEW1Er/j9m3NzGa84hx6RPWQQUcsbAzJTnQdNsmJwOOrQCkdPAerMEiKENiOz1Nw
 8fyQ0bk7x/2Z+gpFI47GOumFABs74GeN/lZ6bCHOVg6FNFcRGX3I4gDzyK+/cf8XsiJFV+V+erq
 u64SmW9USR8QvFfdImQmyPheWYW2GYMsXVTmcJgkNkINkiYJmXc/hovJYLp1kwTuBga56Ba8TOy
 1ESLV/yowspD4SRkuczb4j5B0nODoBJrnuJyzsJIg/bug35sBbsJh2dcp1/idW0kDJuGDIfHRuF
 wHnaF+UDeXPtcVXqItkgQ8oDget+7QnN4gfPcfMvweWRfvf/0e6xZk9UEw2XCYgoOU6hLU52xdC
 XdEKmpsdI7OL19mEl1Q==
X-Proofpoint-GUID: 3GjIJZs4UdruXGJ0f0BFxRkB4AK4iAi-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65467-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,lists.linux.dev,vger.kernel.org,lists.infradead.org,nxp.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,nxp.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 323916B6E7F

On Mon, Jun 22, 2026 at 4:31=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Use fwnode_graph_for_each_endpoint_scoped() to simpifly code.
>
> No functional changes.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..23f3cc30a15a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct devic=
e *dev,
>  static int camss_parse_ports(struct camss *camss)
>  {
>         struct device *dev =3D camss->dev;
> -       struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
>         int ret;
>
> -       fwnode_graph_for_each_endpoint(fwnode, ep) {
> +       fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>                 struct camss_async_subdev *csd;
>
>                 csd =3D v4l2_async_nf_add_fwnode_remote(&camss->notifier,=
 ep,
>                                                       typeof(*csd));
> -               if (IS_ERR(csd)) {
> -                       ret =3D PTR_ERR(csd);
> -                       goto err_cleanup;
> -               }
> +               if (IS_ERR(csd))
> +                       return PTR_ERR(csd);
>
>                 ret =3D camss_parse_endpoint_node(dev, ep, csd);
>                 if (ret < 0)
> -                       goto err_cleanup;
> +                       return ret;
>         }
>
>         return 0;
> -
> -err_cleanup:
> -       fwnode_handle_put(ep);
> -
> -       return ret;
>  }
>
>  /*
>
> --
> 2.43.0
>

