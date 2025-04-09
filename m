Return-Path: <linux-media+bounces-29775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B88A82C62
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 18:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1E5C19E7EA0
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 16:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03FF26B2D2;
	Wed,  9 Apr 2025 16:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K7Z19thJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864926A0AD
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 16:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744216020; cv=none; b=qd6gry6V2lENp0xUHB1e3w01SXdfP0jqL8GkWWOZ1QhPYupxI4xqoIENzU2KQw5M0ZWtMS+CU8kk6yWU8ApszeFfqJGV11kpT71bUMVZ3UFf//7y5hw3wWhd5IFImEB1LdU7QWLbTRe+hfCJOxln4/mTLHMcCnVkQhcayfuKM2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744216020; c=relaxed/simple;
	bh=I7bKAVYH4lAfQNoycierrwfzAOJeEsFuwQlPVG/ml1A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XCv99fbYYKXgwAUl7qoxm7ejQZnyVqC2RoMa9O8ijpbVvhZy76IJFtzwv6w7XCn3QZxUF+mKf3D/lWheSTeI4Ck+aJX63hi6LPyaJutvgKG55xiU/V5nZUMMI3Sl5ZovKUh0zIc7lHhwxYU0bP1pqHjOC+p0zU1LxBojRP2V1fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K7Z19thJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso35982335e9.0
        for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 09:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744216015; x=1744820815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSp4ty85LzeyrRbTnah9LeTjNVJM7XWlOpFLqxqVkeg=;
        b=K7Z19thJqZEILrnO5EIj9SWCf2Syv2H5Odzmu2UXkofGXLP/UP35m+dLP8E5gu3x2t
         CPFriSuq6KgiZkNbxpcC1V3xUxTHqad5vMaMGBDqBrEzj/usoeCwGAlvTZWtxIAPdJsN
         i3zyQtSdtLX+kZClKZ2H7QTrMFN1PkD6MKmQtXGXH67tGQoitalF0tO5nu8tyO7PvqW4
         RZsKlHwB57TjGChst1XkR7GxdB03AHOWiym1ABgpn8r2Tgu8bwHUSIqOkUWiwyv7SVrj
         Dz5Dt25ZVxB8VaUXZoVMj/JlErPURQqwdEv7RXBCy20grK8/jjR0QJ1beFxlPrI61SwK
         eiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744216015; x=1744820815;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JSp4ty85LzeyrRbTnah9LeTjNVJM7XWlOpFLqxqVkeg=;
        b=GAL4nA/3QKSi+1XiARLRyqFGBriv473p17pzI9HRyx/1DGie8XTYuIEectNSruXwQe
         ZcbfW0NdgPmnmKYKm3ipE9EWSOlF5ZIPxpNmFYrYzUNFj39sO7dn+Sa/3Rq4zjpjuLgm
         JXaTGvIp/2aiWCwIZTeZrquB8UNy3+innqAElfZgdAAKsCy4xsgdLX88fjt1Fsc7g4Q/
         8DhfxZzJSbTQ+a8RPGZ08Gb+FievPyhQ3v4FxiaEaP/NYR2XFY+WqWlAXyVpHfSeMGvB
         PkUkLDQy48+E1lwHsknC79CQK8u4pha56szewKV/mrzE6SxOn+g3qO7vwwxKWekbuQ9f
         QvaA==
X-Forwarded-Encrypted: i=1; AJvYcCUxr20OnYK3rshffrGWRJNt8R441b2w7KTK1faSIlK/vvZ9kG6/yKEPvWXDwhgVsXJ5wTo4Pww+Vq/Ndw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcWWl5WIqnfuUYSl50IThztwgKSKgQVqnrAxKVZTP4U/h0uiQn
	xy2B/tInfHjB/bhSNbu9VJQffp+rAfKZzIbjkm7GTEAX/KJS6khc8LOGuQr7T9o=
X-Gm-Gg: ASbGncv19NztRKewncJyH8MFvejzgu5oHVJCsZpT0lFow7m+jdi9J8AFku9R5csKhK/
	lkThxHJzYWlZLtCnGY+qN5U9tp8N8BX/NXewdsEj/3QtCkAXeEkw93TAyKoVBp9LKmbO8mS8hxL
	Cl+SSpTJXS5DG1fWcRStUa/sHLaa+Rsnvo7H3MXi1k1F5ADNqpfwkMviK1sB48yNf95hewuxt0C
	Lq7uJKGtwVfiM/LWXa8htvQ5VLVg7kVRdgD/MFP61EVOGGRCDmWSwyqVY4ASTUwFCDE87yJo4tW
	CcnH59qlgeN3zjNcVJc2i4yPQQzS1z2ro5upKG3GgG1KkGUfTAon7EU+CKnghqnNGHDzG2+z6GJ
	6Mh4YtvAHcbKD46F9Rg==
X-Google-Smtp-Source: AGHT+IE4pgJC7F75RQmdvqxiCKqZVfdVoZauqghq0OlFNK0wjkzDjhkVHca4QNEGcxe3FS6jbliKiw==
X-Received: by 2002:a05:600c:3484:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-43f1ecd6affmr44410605e9.16.1744216015215;
        Wed, 09 Apr 2025 09:26:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:87d9:979a:1261:ab65? ([2a01:e0a:3d9:2080:87d9:979a:1261:ab65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205eccd8sm24795565e9.5.2025.04.09.09.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 09:26:54 -0700 (PDT)
Message-ID: <72a5b302-5c99-4457-86c8-5fa994c93c4a@linaro.org>
Date: Wed, 9 Apr 2025 18:26:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 00/20] Add support for HEVC and VP9 codecs in decoder
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <801511ac-78db-476b-8f1d-a478b0b64bcb@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <801511ac-78db-476b-8f1d-a478b0b64bcb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/04/2025 16:29, Bryan O'Donoghue wrote:
> On 08/04/2025 16:54, Dikshita Agarwal wrote:
>> Hi All,
>>
>> This patch series adds initial support for the HEVC(H.265) and VP9
>> codecs in iris decoder. The objective of this work is to extend the
>> decoder's capabilities to handle HEVC and VP9 codec streams,
>> including necessary format handling and buffer management.
>> In addition, the series also includes a set of fixes to address issues
>> identified during testing of these additional codecs.
>>
>> These patches also address the comments and feedback received from the
>> RFC patches previously sent. I have made the necessary improvements
>> based on the community's suggestions.
>>
>> Changes sinces RFC:
>> - Added additional fixes to address issues identified during further
>> testing.
>> - Moved typo fix to a seperate patch [Neil]
>> - Reordered the patches for better logical flow and clarity [Neil,
>> Dmitry]
>> - Added fixes tag wherever applicable [Neil, Dmitry]
>> - Removed the default case in the switch statement for codecs [Bryan]
>> - Replaced if-else statements with switch-case [Bryan]
>> - Added comments for mbpf [Bryan]
>> - RFC: https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/
>>
>> These patches are tested on SM8250 and SM8550 with v4l2-ctl and
>> Gstreamer for HEVC and VP9 decoders, at the same time ensured that
>> the existing H264 decoder functionality remains uneffected.
>>
>> Note: 1 of the fluster compliance test is fixed with firmware [1]
>> [1]: https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com/T/#u
>>

<snip>

>> ---
>> Dikshita Agarwal (20):
>>        media: iris: Skip destroying internal buffer if not dequeued
>>        media: iris: Update CAPTURE format info based on OUTPUT format
>>        media: iris: Add handling for corrupt and drop frames
>>        media: iris: Avoid updating frame size to firmware during reconfig
>>        media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled length
>>        media: iris: Add handling for no show frames
>>        media: iris: Improve last flag handling
>>        media: iris: Skip flush on first sequence change
>>        media: iris: Prevent HFI queue writes when core is in deinit state
>>        media: iris: Remove redundant buffer count check in stream off
>>        media: iris: Remove deprecated property setting to firmware
>>        media: iris: Fix missing function pointer initialization
>>        media: iris: Fix NULL pointer dereference
>>        media: iris: Fix typo in depth variable
>>        media: iris: Add a comment to explain usage of MBPS
>>        media: iris: Add HEVC and VP9 formats for decoder
>>        media: iris: Add platform capabilities for HEVC and VP9 decoders
>>        media: iris: Set mandatory properties for HEVC and VP9 decoders.
>>        media: iris: Add internal buffer calculation for HEVC and VP9 decoders
>>        media: iris: Add codec specific check for VP9 decoder drain handling
>>
>>   drivers/media/platform/qcom/iris/iris_buffer.c     |  22 +-
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
>>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  44 ++-
>>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
>>   .../platform/qcom/iris/iris_hfi_gen1_response.c    |  22 +-
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  57 ++-
>>   drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
>>   drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
>>   .../platform/qcom/iris/iris_platform_common.h      |  28 +-
>>   .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
>>   .../platform/qcom/iris/iris_platform_sm8550.c      | 143 +++++++-
>>   drivers/media/platform/qcom/iris/iris_vb2.c        |   3 +-
>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 113 +++---
>>   drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
>>   drivers/media/platform/qcom/iris/iris_vidc.c       |   3 -
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
>>   20 files changed, 948 insertions(+), 153 deletions(-)
>> ---
>> base-commit: 7824b91d23e9f255f0e9d2acaa74265c9cac2e9c
>> change-id: 20250402-iris-dec-hevc-vp9-2654a1fc4d0d
>>
>> Best regards,
> 
> Assuming we merge Neils sm8650 stuff first, which I think we should merge first, you'll have a subsequent build error to fix [1]

I agree, it would be simpler, I prepared a fix to apply on top of this patchset.

> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linaro/arm-laptop/wip/x1e80100-6.15-rc1-dell-inspiron14-camss-ov02c10-ov02e10-audio-iris?ref_type=heads
> 
> Testing your series in isolation. I can confirm vp9 decodes also getting some strange prinouts which we need to follow up to see if they exist with the baseline driver [2].
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linaro/arm-laptop/wip/x1e80100-6.15-rc1-dell-inspiron14-camss-ov02c10-ov02e10-audio-iris-20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com?ref_type=heads
> 

<snip>

> [  126.582170] qcom-iris aa00000.video-codec: session error received 0x1000006: unknown
> [  126.582177] qcom-iris aa00000.video-codec: session error received 0x4000004: invalid operation for current state

With the following on top of the last SM8650 patchet + this patchset, I have the same HEVC errors on SM8650, but VP9 works fine:
[  115.185745] qcom-iris aa00000.video-codec: session error received 0x4000004: invalid operation for current state
[  115.221058] qcom-iris aa00000.video-codec: session error received 0x1000006: unknown

==========================================><==============================================
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 65f3accc2fb2..7d5116528fca 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -213,6 +213,22 @@ static void iris_set_sm8550_preset_registers(struct iris_core *core)
  	writel(0x0, core->reg_base + 0xB0088);
  }

+static void iris_set_sm8650_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xB0088);
+	writel(0x33332222, core->reg_base + 0x13030);
+	writel(0x44444444, core->reg_base + 0x13034);
+	writel(0x1022, core->reg_base + 0x13038);
+	writel(0x0, core->reg_base + 0x13040);
+	writel(0xFFFF, core->reg_base + 0x13048);
+	writel(0x33332222, core->reg_base + 0x13430);
+	writel(0x44444444, core->reg_base + 0x13434);
+	writel(0x1022, core->reg_base + 0x13438);
+	writel(0x0, core->reg_base + 0x13440);
+	writel(0xFFFF, core->reg_base + 0x13448);
+	writel(0x99, core->reg_base + 0xA013C);
+}
+
  static const struct icc_info sm8550_icc_table[] = {
  	{ "cpu-cfg",    1000, 1000     },
  	{ "video-mem",  1000, 15000000 },
@@ -390,6 +406,7 @@ struct iris_platform_data sm8550_data = {

  /*
   * Shares most of SM8550 data except:
+ * - set_preset_registers to iris_set_sm8650_preset_registers
   * - vpu_ops to iris_vpu33_ops
   * - clk_rst_tbl to sm8650_clk_reset_table
   * - controller_rst_tbl to sm8650_controller_reset_table
@@ -400,7 +417,7 @@ struct iris_platform_data sm8650_data = {
  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
  	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
  	.vpu_ops = &iris_vpu33_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.set_preset_registers = iris_set_sm8650_preset_registers,
  	.icc_tbl = sm8550_icc_table,
  	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
  	.clk_rst_tbl = sm8650_clk_reset_table,
@@ -428,20 +445,34 @@ struct iris_platform_data sm8650_data = {
  	.ubwc_config = &ubwc_config_sm8550,
  	.num_vpp_pipe = 4,
  	.max_session_count = 16,
-	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
-	.input_config_params =
-		sm8550_vdec_input_config_params,
-	.input_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params),
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
  	.output_config_params =
  		sm8550_vdec_output_config_params,
  	.output_config_params_size =
  		ARRAY_SIZE(sm8550_vdec_output_config_params),
  	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
  	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
-	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
-
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
  	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
  	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
==========================================><==============================================

Thanks,
Neil

