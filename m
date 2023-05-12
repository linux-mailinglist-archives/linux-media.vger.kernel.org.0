Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE1BB70088F
	for <lists+linux-media@lfdr.de>; Fri, 12 May 2023 15:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240962AbjELNCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 May 2023 09:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240776AbjELNCA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 May 2023 09:02:00 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9F69004
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 06:01:57 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3063891d61aso9490420f8f.0
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 06:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683896516; x=1686488516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHNLdLV1yL8+y4b8BbEoJJz9JNG8cbYJZ0jmuESeBGE=;
        b=DXeVpHCYMm12mbenJps25wBzKJRDc10719EbMXfRk6rFLfCjNMKjY33/ic9jnZC1m6
         IGzFPmPFZ6bRoyf2AJhiAYR9aKe6+hCdYrF9N5kBf35y+ktxS1Ao5/lH9EtoqirdWJBX
         6+ueMqFczRijADIIEoRRJFRtb04qFhZ0OkNWZwOXTZBNHXpgWCkyo7wy4iDIFTexWkA5
         kcdYDj4RIa13q80tIFyKK3k6l6lDxnLda//YEzz42KlejQ6Gt0pd8awCH10bSM1YzdCc
         /19t05u8gMsIR9lVcX/C8mrX/5ZGcmYVjXtmtX+NxVv9hiK6PxKh0PS8jMe4rEnm3dy1
         ceYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683896516; x=1686488516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHNLdLV1yL8+y4b8BbEoJJz9JNG8cbYJZ0jmuESeBGE=;
        b=RzJFELQLDVAJCn60Fk9Avd5ru1elmRG7ihgxO4xwwUfElziiQMG1oB5VGp7ht6L7wY
         pFvcLcbSeOgeLrYxUgg4KiuLBqHdXlTcq+4961LHpEcgXgP3O5GpxSsTMZnHq0xR7EvU
         PDNie1+nQT1+n6sSwSRjGS3tyOUeggXIPeqrEEMx/PsRLDmTuzhxTmMpJysuK451/eKg
         /lxuedd1pLGc+C/6jciRFqRLTyu8AlxEMbI7FLzWktI6qKmggmr7/ydYdpgc5UAzojWh
         uJ1GuB5g4aNGmjH+wNNVmDTvmCxSns6VUU+528PTQ7AbX9CAZPsXnJ82qMZeqEN8zgCn
         lCHg==
X-Gm-Message-State: AC+VfDw0qtRpLp+3IhHYVm17kca5BL5FU0LBL9ZEZckLBpCwr2Sopqf9
        qXQF9Lsc/KCpJhcjUwb5k0HgeQ==
X-Google-Smtp-Source: ACHHUZ41jeQnFk7iiNK+bYQbaxPy0G3xlNuNN9epfdfcFuJUYV7w3/elbJCSelgwSgfVZZduyn44RA==
X-Received: by 2002:a5d:448c:0:b0:307:34d4:7ec8 with SMTP id j12-20020a5d448c000000b0030734d47ec8mr17712788wrq.34.1683896516089;
        Fri, 12 May 2023 06:01:56 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i6-20020adfdec6000000b002c70ce264bfsm23317559wrn.76.2023.05.12.06.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 06:01:55 -0700 (PDT)
Message-ID: <97a253b6-b8cc-e37a-ffc4-75f0d39e9c5d@linaro.org>
Date:   Fri, 12 May 2023 14:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 0/6] Add StarFive Camera Subsystem driver
Content-Language: en-US
To:     Jack Zhu <jack.zhu@starfivetech.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, changhuang.liang@starfivetech.com
References: <20230512102844.51084-1-jack.zhu@starfivetech.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230512102844.51084-1-jack.zhu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/05/2023 11:28, Jack Zhu wrote:
> hi,
> 
> This series is the v5 of the series, the CSI driver is moved to another separate
> series.

You should run your series through checkpatch.pl --strict

0001-media-dt-bindings-Add-JH7110-Camera-Subsystem.patch has no obvious 
style problems and is ready for submission.
total: 0 errors, 0 warnings, 0 checks, 87 lines checked

0002-media-admin-guide-Add-starfive_camss.rst-for-Starfiv.patch has no 
obvious style problems and is ready for submission.
CHECK: Lines should not end with a '('
#263: FILE: drivers/media/platform/starfive/stf_camss.c:157:
+		ret = media_create_pad_link(

total: 0 errors, 0 warnings, 1 checks, 592 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

0003-media-starfive-Add-basic-driver.patch has style problems, please 
review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#31:
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 967 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

0004-media-starfive-Add-video-driver.patch has style problems, please 
review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#188:
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1625 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

0005-media-starfive-Add-ISP-driver.patch has style problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#138:
new file mode 100644

CHECK: Macro argument reuse 'ptr_line' - possible side-effects?
#155: FILE: drivers/media/platform/starfive/stf_vin.c:13:
+#define vin_line_array(ptr_line) \
+	((const struct vin_line (*)[]) &(ptr_line)[-((ptr_line)->id)])

CHECK: Alignment should match open parenthesis
#597: FILE: drivers/media/platform/starfive/stf_vin.c:455:
+			vin_set_dummy_buffer(line,
+				stf_vin_map_isp_pad(line->id, STF_ISP_PAD_SINK));

CHECK: Lines should not end with a '('
#1222: FILE: drivers/media/platform/starfive/stf_vin.c:1080:
+		ret = media_create_pad_link(

CHECK: Lines should not end with a '('
#1513: FILE: drivers/media/platform/starfive/stf_vin_hw_ops.c:45:
+			vin_dev->isr_ops->isr_buffer_done(

CHECK: Lines should not end with a '('
#1543: FILE: drivers/media/platform/starfive/stf_vin_hw_ops.c:75:
+				vin_dev->isr_ops->isr_change_buffer(

total: 0 errors, 1 warnings, 5 checks, 1654 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

0006-media-starfive-Add-VIN-driver.patch has style problems, please review.

---
bod

