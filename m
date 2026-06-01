Return-Path: <linux-media+bounces-63264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N+gCSeLHWr5bgkAu9opvQ
	(envelope-from <linux-media+bounces-63264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:37:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AFC620265
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60E1E30602BE
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 13:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A023ACEF3;
	Mon,  1 Jun 2026 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BAAJIuOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QknbIr8G"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A47D3A9850
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320838; cv=none; b=JyxfJLFCRZuC1OaesKueJkV625vE7a7v4ubGV0h+8fUjn4jYHn3CX5TCmZTWhnUABarkkN6ehHKViQtwbqpek47J2SzZTWVi7oV4WL6Dk2MSY9IMJmHnTxwTBg4C0lc99waVwh3J+VYMw+2Gg+oI5GXVSl0EdJvtRvQm3ha0PRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320838; c=relaxed/simple;
	bh=Cd+q+iCUJAhmTXk4ZiMFzYTOTF+0kJunESAfCcd5L58=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=On0Mevr3e6dH9G+ua7N0QGA5gpKlQXmWeZ+WKURE+/XEREQFCNA9eRikMoYhkV+4yzMSNQcZOJAQsJirAt/B8ww3yt+TNFSkTGGjQ7K91ZLqfj7y6ZBdN5lCa//URpSuCqTv6LCjmb3/UOO442mkxWS5D0/R25z49L0QBzpsvyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BAAJIuOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QknbIr8G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518e8HU1214113
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 13:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynF+41OoJ/VJrScl6HizWfAx3cNJzrQbeh+TdIExzuk=; b=BAAJIuOEeaJVIFmx
	ZoiVb3vtn9PbdzSKpgtvXR0moCOicWe6066+2LSLxTW8Rq8tXTCiku8aqzBU6zcq
	coT3MOeIzgqWyMvz5er7qYoNqeesy1Q7ehnkLklB/7NTeB5erbWYgZOnCUhvqoNA
	C9Wg2NZo8Z4tXlxv00zRKu18X3zFdFhKX+eztLEE8+au54yjW0FSHvJKZmozGzUk
	LebgRQFYQm1zbOBvmX2b6m0dzj5pBpAtOQ0fkxeG/jGgixAVZKTq9TJIJiwAFoMb
	mOrT07X7pcuTJr3yLyiFQZYlcVOvttY1802+dYbltBhjje1AsdZwx27y0y8cTvU0
	LlXjpA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s995kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 13:33:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f424d5bso1017480b3a.3
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780320836; x=1780925636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ynF+41OoJ/VJrScl6HizWfAx3cNJzrQbeh+TdIExzuk=;
        b=QknbIr8G7MRTABN9wJd7+9IBope5XkzzhedFJywxQ5inByGVJAZ0Aq5fWCDJDx6tyn
         VttpJe+plwrLDWdkngZiOIjRNz+YXloCLGyx2kFzLatMrK0m6JFSn3HtG2VcXnIJsiKd
         jAj3gLVHrvAeDcQoM2UxXHiIfXNqgrvAbedP9tJgt3JvQ3sDtCNzaA3h+vMzh2GvyivC
         dwySTEWvnYTdL95uR1+A4KY6OQYwyFV6MsNqaVKN2VGKqyw7dyabzMqSYsnJe+ypw5LS
         hkNV/sbSGfjozlWe1wLpq+JY8poELuTuwPNe4ApL+T+l6RvpG8iPIzGJx44MmSsSfNWQ
         HJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320836; x=1780925636;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynF+41OoJ/VJrScl6HizWfAx3cNJzrQbeh+TdIExzuk=;
        b=Oy0mbAbqVAjHhISdk2fdNp+yBip1xJ0c9PlLBfVUTv7u5qnzrec5K5v8GiDvj0F8e5
         MI5a3ifX5/blJoUV+PhpS0HoxygGOTkn2dz4QZNDrEshSRzm9O+qFY/Xa4mlvQptAfgX
         Z/kHewgQ7ttoQq6863bwSDS0a5xsq+7I8UIavp9+apOjpXkEoPRDZo8VIaZP1gytKCDG
         EQYyWjvu7/myhbU+wcEPZ5zCSM0aW3pyeVUoel/YvwTGnH3yIru3PwJ0bo4UafJJtG2m
         DEJVuwAqt3WuxjKXoC8sEA5/b9rs54yWNzJtlYrDIj22eaVq3TGR5rbqkTR48x+GFFRP
         2WLA==
X-Forwarded-Encrypted: i=1; AFNElJ9PjTTavw9fCobHB86xuOIDJETK/g6XZfQdEem9/XhoopGku/SCaREXo0nLOL4SSOy9EttUEwF8/VQ2ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnafoFox76Znj7+Pfe3XXm7dmXQMEjKzSxiFyheJSI4nGGG0g6
	zb0w/sO1mzFMuyGlnh7wYlCTJTYpm8imQ7Gu0kiuOztzCcgFU43Ine4gURX8gkdvQj/WI6BAHBv
	zJ3zxayD05OPMZZLOU1gXZB+zG+4dBrU3XmGx6HS87p2pnxWRZg+ETIAYl99b+Wfv2w==
X-Gm-Gg: Acq92OF0hqgm7EQJPCY+ZpgBIhXXLbOGnlak5xSGWcskzOzT5ispR22SdBvCDLSMwS8
	DliAuBs92PQKZT+S+Dxrw+HJ5r6QoSeg1Fo40NVPXeCY4385MWAw+NGVtzJxfCD0GUhaoBeE4JW
	173mH0xZWNn+D/W8NLvuO9Wh/fDIzFsdjiQ+BqZVC6b9fSih9PJG6bHvmuMy+h0NRAONrEXYfqI
	owG+5uEV8Wuno2dF+073Zpn1c8Wm5KCQGE6M95owVS3lGgADffVkcwDzeZUkBUIENMi2dilOJRI
	zIXObmIA9CYyA0z1BemwVLI5lWHGmbZv0l+3YahpXXA0/qTZFbl4FwL8ZU1MBC7epbIeRSjOv5l
	71goF7057RiP5mL/awlKBrOc5e6xjj2d1fpPD5tqLJDtevIJ0aG95iBT5d0tttg==
X-Received: by 2002:a05:6a00:749a:b0:842:5b66:3c7f with SMTP id d2e1a72fcca58-8425b664400mr2129412b3a.0.1780320836209;
        Mon, 01 Jun 2026 06:33:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:749a:b0:842:5b66:3c7f with SMTP id d2e1a72fcca58-8425b664400mr2129376b3a.0.1780320835731;
        Mon, 01 Jun 2026 06:33:55 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214d018fcsm9858622b3a.60.2026.06.01.06.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:33:54 -0700 (PDT)
Message-ID: <b88ae6eb-6571-40bf-a668-b4d85418cb60@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 19:03:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] media: qcom: camss: Enumerate resources for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-6-bee535396d22@oss.qualcomm.com>
 <20260530-efficient-inscrutable-grasshopper-40cd21@quoll>
Content-Language: en-US
In-Reply-To: <20260530-efficient-inscrutable-grasshopper-40cd21@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WMEE1WXbLbzsDxTdUHfnp0cdFIGjCP7R
X-Proofpoint-GUID: WMEE1WXbLbzsDxTdUHfnp0cdFIGjCP7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzNSBTYWx0ZWRfX06hzdxmw3NBi
 3W1geFg0azg34IX/L3lSy67l4m6k40PnnTqFRf5HT6uHGbQ5rX9nUxli2JN4hxAHa5sTEfykRzn
 RUs8qX//LqPBI2oyhqB06gZb+HeSDdsadtb/f0i87RajGTi9Rry+fkHxq/0wEGgMiMSE3ZzlHxW
 16xawZO18lC7QHj6/3PDzW4QWbGbQOu788uMk5ehC7eBTu0AWSJ7SlHddrMCQce7LLTKYOSclf8
 T06sI6b38Mcw0vpPmYonqP6+C56UIw8aSHF+IWm337RcPI0gUPxzGkGa9BZdRcglDKwg5Wue31L
 pKAp0KcpqS9922lyWGiL2zON35rLeAyJ/MRb9V0KnjaMPb9+J6q0Hkd3Rn/nCFTXC8YCa6E6n39
 fuYZTsCiGqSVQ3kxFMX9qxWMYpLVatsOMblU/TdO4HyY4SLv9xRW1ARIXzAqtFPzw2ZS83TXE6x
 y+78WSysdzvbYpCQ44g==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d8a44 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7s8xYYrCI25hbqUs75MA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010135
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-63264-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97AFC620265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 30-05-2026 17:57, Krzysztof Kozlowski wrote:
> NAK, this is getting ridicilous. You add incomplete "compatible"
> claiming that such change as adding a compatible is a complete work,
> complete change (as explained in submitting patches).
> 
> Then later you add missing description of what that compatible means.
> 
> I could not stress more how WRONG this approach is.
> 
> Stop inflating your patchcount.

Apologies for the poor patch split.
Will squash patches 3, 4, 5, and 6 into a single driver commit in v2.

