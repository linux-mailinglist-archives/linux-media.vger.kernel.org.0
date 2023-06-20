Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C0D7363D8
	for <lists+linux-media@lfdr.de>; Tue, 20 Jun 2023 08:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjFTGyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jun 2023 02:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjFTGyi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jun 2023 02:54:38 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78217E58
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 23:54:36 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51a4d215e09so2483588a12.3
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 23:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687244075; x=1689836075;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RHu+NkMzqrH0464bp3H0UR8X3Xh2cwMlvvEyc29F4/o=;
        b=hvXhMlsaDSHljn/iQL+wAUIsXvYnFkURkgRmpZmprSNHQQ1jvuglXK347aHmP2eM/Q
         WonOw43LoXkH7ahUb+QX9Xs8uquo+gqLt8AzkGhL0CZUVF8VDc4V1G30KZmO+z1ngnSH
         J6ybJmYAmIxAGSNOWmz9uJj1hHjkrXICVb4pNCNcPdgLWPHBYhkjBlRQjA14IiUuy9ms
         7aKe1THGVBHJ+u1sPq5a5ypgx7wGVDYYGdK1a7IUazW1+tWnIm/a5zZMXz3RGojXAIQq
         UOR0zdRyquXYLcHB09TQldGpIJ/aPA/oSDKord7ri1NhnuJ9VJRs6KxtPVFSf/qEFqpT
         OqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687244075; x=1689836075;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHu+NkMzqrH0464bp3H0UR8X3Xh2cwMlvvEyc29F4/o=;
        b=MRjqW0NAxpE8e1Xcj4aq7y5yaVs/nq9fT7wig+89Oa4brAqZTeiHaXTSiKzRBk8JpT
         cOl4nbF7LOGzbXuDWz7+fN19dRs80VXsI2UI+JAzeQT6ZYwBYijidHVCEclpnkx5Q2j7
         cBdBDoEjQmkZqhRbdzMBekOD60puLb8fdL90hUC4B7OCqfywYRMp9oIatFYlJJOoFEq7
         5r4TUojjuoYhaO/3YDjzZS5dFWUfMC/8ISUVlcECNHeryMBTnm4oXeSClcQc208gUumu
         36PwQ1qGTV5k8rx9HKxuP8pkU96T38tm+lNFRDELMcO0avAf3vEbd2M9OFrFcnlIXdA9
         RbJQ==
X-Gm-Message-State: AC+VfDx9BM8vogqRE2iDVTr3TzUycYFXsBhYaxabDP0JmsAC1bMHEtZT
        nghZAHJhBCrb2TH1e0qyspvgrA==
X-Google-Smtp-Source: ACHHUZ43B2VPU7TMOZvj2PX+FF53M27z8ouHa2MimhQa1X8PJqcPLyCiANbz4hVvB6Hhc1wNfX/bug==
X-Received: by 2002:aa7:d6c3:0:b0:51a:4ac3:b7e2 with SMTP id x3-20020aa7d6c3000000b0051a4ac3b7e2mr5083958edr.19.1687244074846;
        Mon, 19 Jun 2023 23:54:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l13-20020a056402344d00b0051879c4f598sm627907edc.66.2023.06.19.23.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 23:54:34 -0700 (PDT)
Message-ID: <eea945ce-9b9e-42d6-0387-48ec0c88cc89@linaro.org>
Date:   Tue, 20 Jun 2023 08:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 1/5] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface bindings
Content-Language: en-US
To:     Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230620031111.3776-1-yuji2.ishikawa@toshiba.co.jp>
 <20230620031111.3776-2-yuji2.ishikawa@toshiba.co.jp>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230620031111.3776-2-yuji2.ishikawa@toshiba.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/06/2023 05:11, Yuji Ishikawa wrote:
> Adds the Device Tree binding documentation that allows to describe
> the Video Input Interface found in Toshiba Visconti SoCs.
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
> Changelog v2:
> - no change
> 
> Changelog v3:
> - no change
> 
> Changelog v4:
> - fix style problems at the v3 patch
> - remove "index" member
> - update example
> 
> Changelog v5:
> - no change
> 
> Changelog v6:
> - add register definition of BUS-IF and MPU

You ignored the comments from v4->v5. I pointed this out. You still
ignored them.

You keep sending the same wrong patch ignoring review. This is not
acceptable.

NAK

Best regards,
Krzysztof

