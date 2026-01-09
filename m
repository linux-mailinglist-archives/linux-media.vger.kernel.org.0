Return-Path: <linux-media+bounces-50289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E9D0B2A7
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 17:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3563C3088166
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 16:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3765B363C71;
	Fri,  9 Jan 2026 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHHNohgL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dki+qCnN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF738FA3
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975109; cv=none; b=DyYMRnvQFRrR8s5fY6jTK0rWiQPE7l5HHaSF4Zxva5BY/RpTtjPu488Hy1QWLJl3RjfLKLkhD23k5PMFfINiIermZIgk3Q0GF/obvJx5FGZ6aWfJA0YIo5aBzw6NX4YLgHB103tYJtKPzhS3i2oeT/pPxZNw56EhFMnmjbiZBtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975109; c=relaxed/simple;
	bh=bRsahIX3ht0GHBJx1blAhDC+PMafKVdC6FTNh9VJlp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZssiR3R5Gii6JyqRCTyyB8CDQk8nX5aduWFDKKYSSZFZ7nKEGI+PX1czmvydtPvaJGonFOq8tTGPJWy5ecFhN8ZSXdHdYgQpkSau5MlBHfmNogorZaecmd4DXCLzQw+iG+DtcoZHMjG8fhLZ2K15kEJg4n61WXgzSZ8VUvxiH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHHNohgL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dki+qCnN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609D5qQq3542117
	for <linux-media@vger.kernel.org>; Fri, 9 Jan 2026 16:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0F3msY51CEG685pZ5Vd9mM1nAPXE1h7mU6gkqrwSxw=; b=LHHNohgL+h8Dn5BK
	Ux0iUHBCy+yQettxBalskTQBCp9f7oc/8kKry1xzZZAg/e3HaDlMuSC1eH0k2mZv
	NLdHhuDM1ICNanc+q02wF5T1l+Usdnj2MdK6MQcHS/Q6VnnEnRDvaDV6wLA1lldb
	ypeirGKyy1Zqh1J3qSsREe8bJxe+iRebKpO4DmkFW42xoHb2T+QTHt7djRdBeZAh
	IXE7Efyg03dJBZQscswdBQASgMnfVelmSNrC5zcGzHVIOCrAv3T9OzC5IzQ6vcow
	4X/1XN8dGT+CnXNDgHwnRIaTBslEI1RnXfBK8h1plNlHnK+Yg27Rb4uX6AveXiZ7
	cB4S0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b1v69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 16:11:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b259f0da04so1099700285a.0
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 08:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767975106; x=1768579906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y0F3msY51CEG685pZ5Vd9mM1nAPXE1h7mU6gkqrwSxw=;
        b=Dki+qCnNjIH3V341Y0rvruCGF2FZT2JAlbqHfGdh7AMjNwTtx6r/ststKlcaFjLLzr
         qdkMJaeV+F3JU9TQTY5xnybM002XEtcv/BCczXJKjrsqehbbHm3kEz/FFewPKR4s0b4F
         Em/ZcFJbzo+t98NXTe6DgeDDUf2BvUK1lyMyPutrPc+6V5DI3DJ9Cs760dDlQBm3wxhr
         b0+H+2v3967rjo43h9+Qv8Xgp7jrUQ7TMNGJT2t3fq093rBACGoyZPsfmz7XKs+KP4mw
         n7wiQ1ckcAfab5eHpzodyaoQVpsK8J/n6YD9SYlcOYFTY8kMt9AQ8XWVYl3EmU9mz6Kv
         ZsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767975106; x=1768579906;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0F3msY51CEG685pZ5Vd9mM1nAPXE1h7mU6gkqrwSxw=;
        b=Srvmii64uudCIsq+1mA39HazaAuXhqCGo0NFWRV0bqI8GHfswNEMJdwvAllUA06I1I
         d48Wb2KVqBDtZZ04SIFvS/UhkB5g0pwbhK4IuGr7yV/P3IF/1T5Do9NzwodpKG0ksceA
         a6qD62VKA/kpKXIRxH8d46HvgONSMUoJV9FOrbzdRCgXLNkRTGWqrHAZiIjhZyy9QIVt
         tG8eoeNZ4Gmug1X0Qs+OubcThGqLlQyHkOmPmjSOZWBSErFV/X7Bz1RHa8QhMy0VTN0k
         teByoO0eMezwaYNBkgHpaYWSrJ/ZmTWZtJ9cEgZZ4qcrvZMo6r2XWMlojDN4QJaZHIO9
         foug==
X-Forwarded-Encrypted: i=1; AJvYcCWq6OPjKBC1l4Cn6NlJeZrAbBc/FS7VIELsWqACkl0B3Nv/pBAadPfX3pVD49VHOB77xyfFjbTVNgsR1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvUd6X+6gadMBLLKLFZiH7qsUyAmqdA5p3VyWJGzLjmke7NLbQ
	ADjS7UOZ7eVwluThlPtZOWF5kId2M87s/j/b9Z7+LsVTKxGWZx/SBWLqBMflXozCrqm/JBMK7sf
	S3opzpBwbmK1LucLCCZwspDqT3dDEcfHYNmQyqtaQbjEpQIMhZTKBhbeBcz8cLE2PkQ==
X-Gm-Gg: AY/fxX6PA/U8ixzYI4spygLhnl2IjY4iPSJHNThWsZRoXTVLdbbJ4z1Yp+0vm3OotOR
	drpyHWzuxy/ZXtsNvcgNvJoOrHepFdL3kVMTQCdYBHqBPyAzLjbSwaTdbNO4tSeZ7oeRc4mwTfu
	OQdSuybopm1/uBvpcrK2GndWygWVriNvhn+Gsf20MSlZhQPpDEi3C3bOEhEcdqK68UyNj2AQ3gk
	1bLVIQlw12gbQhHsFKRejJHNZ1mElhPuEvO5Tdu85tJI2NLfkY7sN3oBWsHfvvvZa2xTsUj1wK1
	zs0eI7LjjCCQz1l3NFh+6jI4Mw0SrDsb4Rr4MLz8GqiuhUMhM+3G+y1yHbYpsrr5TCqIWJtHnIz
	pemNnVgIYf5B0pYB1BOuFDKEFCqx87Jwzqbx9aA==
X-Received: by 2002:a05:620a:2849:b0:8b1:f1e4:a3d2 with SMTP id af79cd13be357-8c3893917c6mr1302268185a.24.1767975106089;
        Fri, 09 Jan 2026 08:11:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGy5T1E7jUrBX1bssLpIPnC4OcyFtfkLbBfyt51Wt45hTzCQ0qm3TofJwyMoPJOoK6/cA59Eg==
X-Received: by 2002:a05:620a:2849:b0:8b1:f1e4:a3d2 with SMTP id af79cd13be357-8c3893917c6mr1302260485a.24.1767975105583;
        Fri, 09 Jan 2026 08:11:45 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d31e7sm1189140466b.42.2026.01.09.08.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 08:11:44 -0800 (PST)
Message-ID: <09bc1f51-1836-4981-9fec-e3385c61aac6@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 17:11:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] cdx: Simplify with scoped for each OF child loop
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, llvm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-6-24e99c177164@oss.qualcomm.com>
 <20260106101733.000059e9@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260106101733.000059e9@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyMSBTYWx0ZWRfX2YUCxZb3tQc7
 jbD2GTdT8NfXk+opTnikLzhtv9U45tS3GVf8ffU/7a+HM6S1YPh4OfjiqiIudTqFdt7Ty4G7+tl
 aDdp9iAX+io8aRE9KGaRL/YnZrTGtnApM3h7//1VJUqa9Vk7tkWoWxbjb62wRCDVpLXtAmoNN/0
 UWHhRpHel9CbSF8Nm8XynhVYAIOwFlyQV4VhZ2jckgVe3ZA4TBRndEv07mjwxs6wSyIJ4tbsQU/
 PIc+fqLI4eBEyJWCjODhUlGZosgZWvreJ061IO2Jp4iVfAiZeqKN6bijV9jUkz9Sy3ImDqEyGQF
 Eh71EzepBwkUZByrGaRmIzvL2ZeL1ZN/nx06Jixa8hIKI8DiW668LNRW1Z6y15v7ztZvudmAYVL
 TYcItneSSkDDc83ilixluUZ0GsA9Kr2lU5+wBvEWnRT/m4pnqKWP5yGxvFNDBX4pspBomBlP4vJ
 l+w37o6L3+YLqnZQhyQ==
X-Proofpoint-ORIG-GUID: gMyMdWgClVu5yRJDmGTATLSXwEt8oova
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=696128c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XFS3ILgPfShOvr1i8A8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gMyMdWgClVu5yRJDmGTATLSXwEt8oova
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090121

On 06/01/2026 11:17, Jonathan Cameron wrote:
> On Mon, 05 Jan 2026 14:33:44 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
>> Use scoped for-each loop when iterating over device nodes to make code a
>> bit simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> I'd be tempted to make one more tweak in this one to bring
> it inline with the suggestions around not combining scoped cleanups
> with gotos (see the comments in cleanup.h)
> 
> No bug here, just nice to have.
>>
>> ---
>>
>> Depends on the first patch.
>> ---
>>  drivers/cdx/cdx.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
>> index b39af2f1937f..bbde529aaa93 100644
>> --- a/drivers/cdx/cdx.c
>> +++ b/drivers/cdx/cdx.c
>> @@ -608,7 +608,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
>>  {
>>  	struct cdx_controller *cdx;
>>  	struct platform_device *pd;
>> -	struct device_node *np;
>>  	bool val;
>>  
>>  	if (kstrtobool(buf, &val) < 0)
>> @@ -623,10 +622,9 @@ static ssize_t rescan_store(const struct bus_type *bus,
>>  	cdx_unregister_devices(&cdx_bus_type);
>>  
>>  	/* Rescan all the devices */
>> -	for_each_compatible_node(np, NULL, compat_node_name) {
>> +	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
>>  		pd = of_find_device_by_node(np);
>>  		if (!pd) {
>> -			of_node_put(np);
>>  			count = -EINVAL;
>>  			goto unlock;
> break instead.
> Or better yet a follow up patch to use guard() for the mutex allowing a
> direct return here.

Oh yes and it allows to drop that -EINVAL assignment to size_t.

Best regards,
Krzysztof

