Return-Path: <linux-media+bounces-54558-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMqrHpP5qGlzzwAAu9opvQ
	(envelope-from <linux-media+bounces-54558-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 04:33:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2015E20A902
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 04:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09C58301DF49
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 03:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECA13368B8;
	Thu,  5 Mar 2026 03:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o38A+qH5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/V5ArdB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521DF15A85A
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 03:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772681603; cv=none; b=DP+Blpsb4mm9YaWVnSrnMwi4hm4uYf1xghVc/8jJgwzlskyBckzGDLrwB6e9QuFqQWE6g0ypgCijN+cG7QsgV6xQ9cFAvDMByZaFrJzPGn78E7Vl9PrIQQJByt9qnF4L4BA6sCIgcSvnIjP1Gl6qedeDh4e7wTHa+cpkiEv7lTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772681603; c=relaxed/simple;
	bh=cIahUaIbGQDw0acEwfY4xZO7Ltd3QgQaB7V/iwAk9E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJwWS2mL9XngYWnTvFks4BFuQBzvR7QwP0TSCsThwtT+Pu1lY6GFVIaY+pFvZxFBOCH06X+JUBotd1IdU8IFHqwzQ9sFUM7MDetLtbatNloweui2QJrFjKs/mBwloqc9/o3RuqBITJjBXOt0l+HCeE0AiD4Y12PnI0iYCnsh3X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o38A+qH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/V5ArdB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251C0DO3160464
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 03:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PyP3Y+1F9PT+kk/ROvpwez7s
	vdDMe9wKcbVyRbqm7Uo=; b=o38A+qH5OcCfacTL9IKv4s9zDLMYtfPDGQ+juVUz
	HP6kn8EkQxT8deL0BOyAqCGwlpcXi+5R1qoJjXWWyvtDymKClwmy/oqfwtu0XIp/
	2hRdwOiY/n66waZKmPx+U71fQwhbbBHw50a2hB2b4BCQHG0xiIQ/qo61eBUSAqXJ
	WtHD6UJfKak7xyPeGIAuWN1ocIZ1Q33HuR8GnF8owl5ujroG/AeboTYxGZSrlscv
	q0tL4pC8nXz0LBGhEPzTBHM2sdxsXxuKVLMpH1+igZq9T920oco8MLORgSe0Xthm
	58yfLwGhsqMdlS+HsDFqK/Zv1wjOuYvgq0+DY1QETytilw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5txgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 03:33:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb5359e9d3so4909776385a.2
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 19:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772681600; x=1773286400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PyP3Y+1F9PT+kk/ROvpwez7svdDMe9wKcbVyRbqm7Uo=;
        b=Z/V5ArdBwpWC82idVWczlWY/GfeBOXIPXeCQ/lICW9S/mBOhoGvi1hNzA871VxDfyS
         QOk7/aQaK+DD/QAvNFNBcavajHALmo6/8x62ykLH1HQ+WdUdrIW+cQkSnQeFwRdluPr0
         XgupQR24411CkQMmegjFOcNuxJqrlBSEgQ6uipSz6fmZgJakuahQPxnTHBLbJGrsBJu9
         k7IhlZXHQO7uu/DmAH8uDW/j9XBq2/cREj5+LbJQJ062qnVaa1Kp5WWoZ5m64yq5gX60
         7Fe+1b5qLWP+Myymuw1zuugULNXIzDNl5/7B7csNBIodDlyf9Bugj62Xpc1spm3zGdmu
         Pdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772681600; x=1773286400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PyP3Y+1F9PT+kk/ROvpwez7svdDMe9wKcbVyRbqm7Uo=;
        b=XS3xU1rVLgHU6JY4VGf9ygSPNWHucY9NsZuJJHhC4ujWaboRYffbXDIY5BXlTAi7h3
         T/PSdOTTqCQsAQ2v62OoGFmAeHg9JxLNUEtu0Uuu9x4FiB0N+Rr0oJ+Rn3287wQ0MJY6
         Lo5F+xKxQ2yKLk/s5V4oChwrDmqrVdHAeCi1oXuvJntwc86Ikk4kojfAbAd4t4IRiHWn
         Mvzur+fJJVEPr4jGWEdy+zW9hw4de5GDLMgvjCLlIVhihq48AG+SGsgm5n0GbqBbgVvu
         oy3FRN7e4f9WrhMQTXjNR4/tpJrwoA+Ov3yawQ4p6ndNTrWdCLhuFyMGZCzyzrkIzx+c
         5urw==
X-Forwarded-Encrypted: i=1; AJvYcCVYGPPDVyAKPkHdzE/egf8Z9l55MCspKtSXAXMJLFi8aNcDs0n2+snjGa3kpls1+3GYmyOBLWCtZWQ05Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE7LvsYWl0V/5vxN2zytdMs3p3B0jOfNxi+1WpmjZFlCX1bF7N
	SWtWZizfWu9WnyqzKIJl/mew8lUllAnDX0cBbVW4LNxkqEQBEocdXr1s0qYNi88DW6olr4MavbX
	HBr8QNdNJ5lMGIUU6q/VfjdG3TCJnv4DiqUjNtDF51FTxtJgu1qLo7+eN0HBqwWa9fw==
X-Gm-Gg: ATEYQzzYGdC1LIQ5JqT51O4mTm1gC8vJm6XRI9GWzGgB2L9xnVI8BJf9Je+YziV3hAt
	om2z/GwoFXxnVQQuUsPviKoQ69QlPjRiMg0BK4DMsUKw6nG0nwVd8mPnF9km9Tyd8N1LlSBf3S2
	CE4BQ/vaaWCY5yQChWMIakJg0bh87ckViZyZ0nXNlpGduYAwyJXyz5H4qAJmLMK+xyM2+YahKfW
	2+GZNw85BC52tWkTksHskAEoamEI3yFjwluiKjDUFtHbH5AvEazZd2EKCb/5nxapa7GGWE5O/0A
	lZOD9VFeAHJ0idSlws+VcXDalwaJUWkTmz+6GaesuvPHhpErraQdQUHtAzNbEsbZtj4OvZTVY6R
	V13Fwvfbqg9HvEyY1fhZEAH3JDEudLEOSjYY6T8TvAe774xwrp5W9YxSgPs5LqaXUWg/gdsTP3S
	z2fjuX57dSI0wrocKH50CmKCSe9jGb6eaednc=
X-Received: by 2002:a05:620a:450f:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cd5af95983mr540353985a.38.1772681599598;
        Wed, 04 Mar 2026 19:33:19 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cd5af95983mr540351285a.38.1772681599071;
        Wed, 04 Mar 2026 19:33:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123583e48sm1664755e87.18.2026.03.04.19.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 19:33:17 -0800 (PST)
Date: Thu, 5 Mar 2026 05:33:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <vwvuwzmwqvskibwdobuapsr6rpsqmpknirco4y4jjcav27fiji@g2nwxdj5dodc>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
 <nen35eqhwbikt7jlpxn22hvur33chxibrbmzd6awo425i3mujf@f2cbncxpcatc>
 <635cc998-d530-42eb-95cf-99b0d5baab68@oss.qualcomm.com>
 <fjvug6snigssgheuduzjomzjq6apte2ggixqzjzziwcycee4l2@irh2mkholacy>
 <b0d04ced-8f3c-4bd5-a5b5-0b2f12aae25a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0d04ced-8f3c-4bd5-a5b5-0b2f12aae25a@oss.qualcomm.com>
X-Proofpoint-GUID: uYabd932BjCIAYYUE5rDdRosiPpH6UI7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAyNSBTYWx0ZWRfX3rRMeL0L0MFk
 hajYFzcOAWhcmgpP9X4ynD/tWq4zAiBK5BsLxGNLabJclFPJim+ykBIOYW8yBq0orw7p4A7V7WV
 pZvuBwZrUzSEJhy81UH9cOHr6HkFHrVm/fcJ5UxbVEAi37HnV8b5RNr7jhzgS9SpPhtZogLiyYF
 WbHu8kgaxO0NDBCzjXvbNs6d+jq24kJsxFwrwToeQxBYDiDTjcsj7YVYXLeCZZo5hKOWy2G7kXH
 AzE+6ITsQcMFqbjLSFhgZbRkqQ6o9zYJbwVAotY8F1kkWvJ/r+2MukVPtDU3Wjn+GQAsWzbHajA
 taSYz6hDqumin/mv4ykWnTZzGVvZT08ePZVmmJY5lKTDX69uVwQyBOZQUF5k4apgbGIOy/b5V06
 5Bndze6aXumVXwj9u7ybvRBr+rF/7IbjnRa3hWaevC1N7/iewsET3/xedzctlgOOtQEaHgF827Y
 LdEdY9Pdu8Aawp+QQKw==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a8f980 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=n19I01RymS3B12SaILkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: uYabd932BjCIAYYUE5rDdRosiPpH6UI7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050025
X-Rspamd-Queue-Id: 2015E20A902
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54558-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 08:32:53PM +0530, Vikash Garodia wrote:
> 
> 
> On 3/4/2026 5:23 AM, Dmitry Baryshkov wrote:
> > On Tue, Mar 03, 2026 at 11:43:40PM +0530, Vikash Garodia wrote:
> > > 
> > > 
> > > On 2/28/2026 1:22 AM, Dmitry Baryshkov wrote:
> > > > On Fri, Feb 27, 2026 at 07:41:17PM +0530, Vikash Garodia wrote:
> > > > > Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> > > > > compared to previous generation, iris3x, it has,
> > > > > - separate power domains for stream and pixel processing hardware blocks
> > > > >     (bse and vpp).
> > > > > - additional power domain for apv codec.
> > > > > - power domains for individual pipes (VPPx).
> > > > > - different clocks and reset lines.
> > > > > 
> > > > > iommu-map include all the different stream-ids which can be possibly
> > > > > generated by vpu4 hardware as below,
> > > > > bitstream stream from vcodec
> > > > > non-pixel stream from vcodec
> > > > > non-pixel stream from tensilica
> > > > > pixel stream from vcodec
> > > > > secure bitstream stream from vcodec
> > > > > secure non-pixel stream from vcodec
> > > > > secure non-pixel stream from tensilica
> > > > > secure pixel stream from vcodec
> > > > > firmware stream from tensilica (might be handled by the TZ / hyp)
> > > > > 
> > > > > This patch is depend on the below dt-schema patch.
> > > > > Link: https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
> > > > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > ---
> > > > >    .../bindings/media/qcom,kaanapali-iris.yaml        | 261 +++++++++++++++++++++
> > > > >    include/dt-bindings/media/qcom,iris.h              |  18 ++
> > > > >    2 files changed, 279 insertions(+)
> > > > > 
> > > > > +
> > > > > +  iommu-map:
> > > > > +    description: |
> > > > > +        - bitstream stream from vcodec
> > > > > +        - non-pixel stream from vcodec
> > > > > +        - non-pixel stream from tensilica
> > > > > +        - pixel stream from vcodec
> > > > > +        - secure bitstream stream from vcodec
> > > > > +        - secure non-pixel stream from vcodec
> > > > > +        - secure non-pixel stream from tensilica
> > > > > +        - secure pixel stream from vcodec
> > > > > +        # firmware might be handled by the TZ / hyp
> > > > > +        - firmware stream from tensilica
> > > > 
> > > > Why are you providing description as a list rather than describing each
> > > > item separately? Then you wouldn't need maxItems.
> > > > 
> > > 
> > > rewrote them as below and dropped maxItems. Please review.
> > > 
> > > iommu-map:
> > >      $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > >      items:
> > >        - description: bitstream stream from vcodec
> > >          items:
> > >            - description: Function ID
> > >            - description: Phandle to IOMMU
> > >            - description: IOMMU stream ID base
> > >            - description: IOMMU stream ID mask
> > >            - description: Number of stream IDs
> > 
> > I'm not a pro in the DT. Is the itemization of the first item reused for
> > the rest of the items?
> 
> yes. As a trial, if i remove one of the itemization from above schema, then
> checker throws error saying 5x9 arguments in the example is *too long* as it
> tries to fit it as per schema i.e 4x9.

Ack, thanks for the test!

> 
> > 
> > >        - description: non-pixel stream from vcodec
> > >        - description: non-pixel stream from tensilica
> > >        - description: pixel stream from vcodec
> > >        - description: secure bitstream stream from vcodec
> > >        - description: secure non-pixel stream from vcodec
> > >        - description: secure non-pixel stream from tensilica
> > >        - description: secure pixel stream from vcodec
> > >        # firmware might be handled by the TZ / hyp
> > >        - description: firmware stream from tensilica
> > >      minItems: 8
> > > 
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > > > +    items:
> > > > > +      $ref: '#/definitions/iommu-types'
> > > > > +      minItems: 5
> > > > > +    minItems: 8
> > > > > +    maxItems: 9
> > > > > +
> > > > 
> > > 
> > > Regards,
> > > Vikash
> > 
> 

-- 
With best wishes
Dmitry

