Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 770AE550D11
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 23:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbiFSVLN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jun 2022 17:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiFSVLL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jun 2022 17:11:11 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D33D65B5
        for <linux-media@vger.kernel.org>; Sun, 19 Jun 2022 14:11:11 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id hv24-20020a17090ae41800b001e33eebdb5dso10825854pjb.0
        for <linux-media@vger.kernel.org>; Sun, 19 Jun 2022 14:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=b5Iirgh+lSN+jvSwdvjRx8sTmALk/hKohItlYHFUmx4=;
        b=dSuuBWts8iAs8IXu8ByewDzqmM5jl2KxqMg7/fBA8lfs0Y8SOmt8rd90/PcfCzeGzY
         qHzed0wqcNswEMcpPSV4JPLjMw8PKkdxlwQ+HAsumeKZO5WdWHxElp3ZMsNDfMAfUVZK
         xGrMZE88S1WRXoxCoNs0+5jqN3HnkEHcGePmwimiDkSZVlynWs/YkySiByGePakIZ2t5
         8qjWoGBdnmrejF7I5pu5WcD2hr/5OO7BeoPXqYhRpUFjIkzGtO4Nt5qjBdr6KgB0rzlw
         O0MV0rbCK5vonmnT3MAZ8mqZv7kll9FVFThz4yRE1IZM/xTwi/2fcOylASQQVgukzq9W
         2ELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=b5Iirgh+lSN+jvSwdvjRx8sTmALk/hKohItlYHFUmx4=;
        b=DIADMXu4fGTkvrYVs8aFOwYF/hdXgpqtIb6L7f46LVYEWjgHmMNHQA1WKKUNt1RvfB
         D4+hTlPjXy1g8Vlyyb/9YPc731XigSZFF3fORNhawfvYCnE3wi08/+9Bb2E6lPGYfAtF
         AzkOCaPbHqaFToDf/6aHhFPXhMyDKCPCCvOR7ZamMOCw014QlCmgDZ1eQ4ox53bTWX71
         2dbpcexdwKQ8f0WCzfMDpaOkVDb8gLfm4kBocaFEVUPAMnSzK4R3Fdt85QTcSEokfOg2
         v3Mg+o/6hJyzokrac5XDTSfWjpWUMZy3+qPtm61l1claBBxG8MVj/yGZV7HoDuBokZ8S
         EBzg==
X-Gm-Message-State: AJIora9mT2DRIJiSppbuR3ESS4Y2uN8AHmGB3TtVxRcM6rnZGbg1Ut9A
        pOUAiKVyeUGaGN+/XQHyY5HVeZH6M++M0Q==
X-Google-Smtp-Source: AGRyM1t+0V+jNdR7Xb4Ci98Oeiyy+W6r7cg9e4D1M5y7HmceQh4vKOi4QME4p/BRNp2z3UexH0JBkw==
X-Received: by 2002:a17:902:c401:b0:16a:1873:5ca3 with SMTP id k1-20020a170902c40100b0016a18735ca3mr6130071plk.157.1655673070617;
        Sun, 19 Jun 2022 14:11:10 -0700 (PDT)
Received: from [192.168.1.111] (cpe-98-149-242-113.dc.res.rr.com. [98.149.242.113])
        by smtp.gmail.com with ESMTPSA id iw13-20020a170903044d00b0015f4b7a012bsm3631618plb.251.2022.06.19.14.11.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 14:11:10 -0700 (PDT)
Message-ID: <26afef02-e088-d787-31a9-d772e82e8869@gmail.com>
Date:   Sun, 19 Jun 2022 14:11:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     linux-media@vger.kernel.org
From:   "Jibun no Kage ." <jibunnokage@gmail.com>
Subject: A question about cec-ctl use? How to sent raw CEC codes?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A question about cec-ctl use?  How to sent raw CEC codes?  I want to 
send via cec-ctl switching from HDMI1 to HDMI2, using cec-client I would 
just transmit a raw control code, for example...

For my TV...

Select HDMI 1...

/bin/echo 'tx 4F:82:10:00' | /usr/bin/cec-client -s -d 1

Select HDMI 2...

/bin/echo 'tx 4F:82:20:00' | /usr/bin/cec-client -s -d 1

So now I am trying to convert from cec-utils/cec-client to cec-ctl use.  
How do I mirror the above functionality?  Can cec-ctl be used to send 
raw CEC commands?  Or some other way to achieve the same result?

Thanks,

-JnK

