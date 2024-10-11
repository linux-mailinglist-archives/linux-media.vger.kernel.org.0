Return-Path: <linux-media+bounces-19417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245599A28D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 13:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86090B232A5
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 11:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACB5215F4B;
	Fri, 11 Oct 2024 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzmS/NPE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2320ADCD;
	Fri, 11 Oct 2024 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728645319; cv=none; b=d/FfnSgXkCaVB/HFylc/u2FN+eU33W3rpnk1PSh7COgWD370W0Tom5kTtqASECF5FefZmuK32CxWOMYUNV3bOzG+vDA9QF8SLsCw5m2Tq/vq4YL48RW2TBylSgN9HzTltJDYWdai+OT8ll0SPqqA99gHTTOJVGPsHaR2GayApX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728645319; c=relaxed/simple;
	bh=/wxFnjdd8oLQxNU2I2l9u/U9YVjipKQwmvkmr0gU8+0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=LB1ZaKdkoo7YhZRzcasiHndh+EDaBh/MyCzEPEe121VA5UzEvGuxTg9zHja0Hdhf3nP88SWDc7w8CzOXy38QkP6LYQWMGT81qPv138pYmK45nAcJk5K49OHmq97KUSEtu0RJIe9/79eiJsAelB0ZBKPxDyEOd7VyhyAST8rW5no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzmS/NPE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7779FC4CEC3;
	Fri, 11 Oct 2024 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728645318;
	bh=/wxFnjdd8oLQxNU2I2l9u/U9YVjipKQwmvkmr0gU8+0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lzmS/NPECTpCG/XMh0pRfsGFUffBTP/KfNudbr9CYgTkNCKSxRyJtqHO+Ey5tHFgq
	 DUBblhya6G1id79W7EgVEF2ekJcWgLS96x5qY5lco7//y/Y5TYjItDmXkiw2R3QygH
	 vCxgWKWJ9DnRkD2zMJMCwpBaLYge4BoJlGX1qe0SkzGW1uCRsy2IFrHI8cIDaExuDy
	 YZAl1fDfzF/pTfk0sB+0nC41aF9WXemr4Ivv1JqxFWhuJXcl4aR8uLpLNo6BjIo8FJ
	 e4jJn69cB2zvGgFyC5yG8Us/Oz9Ipu/VIvR/w3Y+WJDMhhA5tBodcgQgPdaUO24KTY
	 3RpoAUoO0aFJg==
From: Kalle Valo <kvalo@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
  <linux-arm-msm@vger.kernel.org>,  <linux-media@vger.kernel.org>,
  <agross@kernel.org>,  <andersson@kernel.org>,
  <linux-kernel@vger.kernel.org>,  <konrad.dybcio@linaro.org>,
  <mchehab@kernel.org>,  <quic_vgarodia@quicinc.com>,
  <stanimir.k.varbanov@gmail.com>,  <quic_jjohnson@quicinc.com>,
  <ath11k@lists.infradead.org>
Subject: Re: [PATCH v4] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
References: <20241010132902.2882939-1-quic_miaoqing@quicinc.com>
	<asvhh4kzq6s6yz3wrqfmuolcnlonoobogoh45pnq4zdr44lpxs@zgarzpduk2sk>
	<cc8358b1-2442-4a40-8eb3-0912423db554@quicinc.com>
	<3giotvkrwailt75gndhup7xhqvlc3vdowdoypi5vaeebuojp45@vkqxbtjsbksf>
	<c6c5068d-ed05-4b49-97e1-f4962839cf44@quicinc.com>
Date: Fri, 11 Oct 2024 14:15:14 +0300
In-Reply-To: <c6c5068d-ed05-4b49-97e1-f4962839cf44@quicinc.com> (Miaoqing
	Pan's message of "Fri, 11 Oct 2024 10:57:22 +0800")
Message-ID: <87cyk67uwt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Miaoqing Pan <quic_miaoqing@quicinc.com> writes:

> On 10/10/2024 10:40 PM, Dmitry Baryshkov wrote:
>> On Thu, Oct 10, 2024 at 09:59:11PM GMT, Miaoqing Pan wrote:
>>>
>>>
>>> On 10/10/2024 9:47 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Oct 10, 2024 at 09:29:02PM GMT, Miaoqing Pan wrote:
>>>>> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
>>>>> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
>>>>>
>>>>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>>>>> ---
>>>>> v2:
>>>>>     - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>>>>>     - relocate pcieport0 node in alphabetical order.
>>>>> v3:
>>>>>     - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
>>>>> v4:
>>>>>     - update 'ath11k-calibration-variant' to "Ride".
>>>>
>>>> What exactly is Ride? Is there just one Ride board? I thought it's a
>>>> board family name.
>>>
>>> I just follow the existing boards, 'Ride' is a board name. Both 'Ride' and
>>> 'Ride r3' boards are attached with WCN6855 WLAN chip.
>>>
>>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:1112:
>>> qcom,ath11k-calibration-variant = "Fairphone_5";
>>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts:958:
>>> qcom,ath11k-calibration-variant = "SHIFTphone_8";
>>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:879:	
>>> qcom,ath11k-calibration-variant = "LE_X13S";
>> There definitely are other Ride boards. I see patches related to
>> qcs8300-ride. Does that board use the same BDF file?  If not,
>> Qualcomm_SA8775P_Ride or QC_SA8775P_Ride sounds like a better approach.
>> 
>
> QCS8300 and SA8775P both use the same WiFi card, so the same BDF file
> will be used. The extra variant will increase the size of board-2.bin.

In board-2.bin one board file can have multiple names, that was designed
exactly for cases like this. So the memory inrease is just the size of
string (plus few bytes for the TLV headers).

Dmitry is correct here. It's much better to have unique names instead
trying reuse the same names for different hardware. For example, if
later we actually need different board files then that's simple to do
just in board-2.bin.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

