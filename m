Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6D37129C7
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 17:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244114AbjEZPjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 11:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244198AbjEZPju (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 11:39:50 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22982114
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 08:39:46 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f6e1394060so6479825e9.3
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20221208.gappssmtp.com; s=20221208; t=1685115584; x=1687707584;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nc80Vf++PkgDT1J3VpaD8ZmewlaDPACbwdcL/xpFfP4=;
        b=laMSfSL0MDgH3fqqaXZj2twLpktu+TkSK1Rmr3p6KuXIEmlqSC3DqCS34xhyjkzS9M
         a/zPPRECtUaqqUra1wXyFhrJA4kbPJrIoQcm6rj3mUH0h5PLHSYPWUMpVJW3R9iuOF/S
         pUINeEzPICu4UACALtjecfInc1XQVZUJHAd8bFHi5w+fggJcTGbIiBiNfNML2hlZVofN
         DRdlrFbzcMn8OtDGopj64nFQgf+LyXR/EYYV2f9rWAAeSUPxkEPoXS7RZtGT7rXVYXWx
         2sgtRH1oB1rd7K5MD/Yc69LLdFZzBDyPfG5+cFcfESeMo0jFUb85uXuSJZUDxR7IwbJ/
         URHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685115584; x=1687707584;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nc80Vf++PkgDT1J3VpaD8ZmewlaDPACbwdcL/xpFfP4=;
        b=AOWM/fXGfTnNJCNyQKavXdhWPpA6rwpOT4DEtvkNqyNmtOSnHpDaLI4mStU2g2Szdm
         Pzjcr7cowXYYIxPfMmF1HL2eWw8cSDqLiXaipCCXzEmJf2Qjc3aRw12+2nyqF6Vm2CO+
         /buOJkKWIZiAybFvqwIqkCAM1vt2GjkgHWHSa61fPH/38gPog3qLXON5f3QtINZUmQD5
         mWtDaH+eb0Y6KfxyjkEGxZOo9pIFtnx2IZQroKVSs41KXH4CGnEE2PtMfjaOd74EZ91n
         5FZWYjeqB1KC83GnIzMxgz2+oDpSF/7h7yKPLjRQQSuxo832/QKmpmN9AU0XCFCNBAIO
         BuCA==
X-Gm-Message-State: AC+VfDyxgPte9p5XRbu6f9vXb9JP6C7/S9Rn3d9FhF3+Gx1bRSXznWy8
        TSQhej/NU4B+OuY591Ypp2eQNA==
X-Google-Smtp-Source: ACHHUZ7eoyvwlW9TQE1rsUDOyRUUrPjBPEBubIaeg7fuNLI5stBcuH5yn8lVVWq+487qN1E/0CVR/Q==
X-Received: by 2002:a7b:cbd6:0:b0:3f4:fffc:add with SMTP id n22-20020a7bcbd6000000b003f4fffc0addmr1742583wmi.27.1685115584562;
        Fri, 26 May 2023 08:39:44 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p23-20020a05600c205700b003f42314832fsm5598018wmg.18.2023.05.26.08.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 08:39:44 -0700 (PDT)
Message-ID: <33c6748d-e359-ab9a-ab7c-5898bd3df741@nexus-software.ie>
Date:   Fri, 26 May 2023 16:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCHv4] media: venus: provide ctx queue lock for ioctl
 synchronization
Content-Language: en-US
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230526063024.2827883-1-senozhatsky@chromium.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20230526063024.2827883-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/05/2023 07:29, Sergey Senozhatsky wrote:
> Video device has to provide a lock so that __video_do_ioctl()
> can serialize IOCTL calls. Introduce a dedicated venus_inst
> mutex for the purpose of vb2 operations synchronization.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

