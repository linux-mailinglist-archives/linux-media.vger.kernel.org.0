Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE41E3A83
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 19:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503947AbfJXR7o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 13:59:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43244 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503945AbfJXR7o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 13:59:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id c2so21861881wrr.10
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 10:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dM2bjbnpwhKhmN5fwxrizeFsIxtTAmi4FEaB71uW7Cw=;
        b=F1Lsjh0rA5UQWsa48fLK14SunnNwzOCXDTvwZA1jw5bD89UQZsW3jc0QqwQSDvRFAN
         dGLRAqUAuWRCN88heFwF6ts3Ckfy8io5kRqd6mXaaY4YH85qpDH5h4SN2rruDqDcitBe
         MbffITtaSmIeJgGvQ8LmR+I7puZmT7p6e1Q5HwbZSpD7gejZ1m6Rb8WAPMbStWlfj2O5
         6YNm3nZEBgLFsEf5Zjb2gcpsNHK6PYT82PLZsPY45c79Jn3jdBDr2svi6I/XAJ1+vAuX
         XdvVeSH1smHnTVFidFcjxiivyi4hYPkR4Xbzx+0vQ7vszxfXNKbDcfIIe8yOmwHDSso+
         oAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dM2bjbnpwhKhmN5fwxrizeFsIxtTAmi4FEaB71uW7Cw=;
        b=qk4QBWXWBCOCh2EcCSRvp1cyz9PVHePPzIwYiVDAbmD3EnQtF/xuUHEutYcWVvDh9v
         1JrH4bcaET0z7eFzv/JVAXi/i6rfSRKbsBO2sArVCXdM6ZbYGGXZX85cl8QBlq8fHHXf
         w0Zqc28iNnrf1n0ZdISYVF7LUxmyeKJJ6dXf9IxWuNr2Qb8+uD6jQF1NvtFOvShgj00v
         JczB5izzDlKReGiD6KDj8N7Bjp7jx2Vo2WfGXC98z9dA7rhp940J/yn5rCYnrE2Rgix0
         pOO6bcg7ObwH8mSvt3zr+nKM9roDt8lTkBAOOAEfW070GU1epQ8SdELNp41foJDfvJFr
         dWUA==
X-Gm-Message-State: APjAAAWDn0IyG/qn2sjnUZkS55+pOUt0h9h44Jyq6rw4yqu1W829u8MY
        fVi6C/vGwRWUt+WidAweUVqNpBrh
X-Google-Smtp-Source: APXvYqx96gpyS0wjUCGiux3nUjWNg6J7y+GcDqnmPWhAgpTUyO/UpkIDULelpp1T+AfyUbBDoDUNsQ==
X-Received: by 2002:adf:9f08:: with SMTP id l8mr4749489wrf.325.1571939982053;
        Thu, 24 Oct 2019 10:59:42 -0700 (PDT)
Received: from [172.30.89.101] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id 200sm4382522wme.32.2019.10.24.10.59.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 10:59:41 -0700 (PDT)
Subject: Re: [PATCH 6/7] media: imx: imx7-media-csi: Remove unneeded register
 read
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
 <20191024004155.32068-7-laurent.pinchart@ideasonboard.com>
 <3363ebfc-c78a-5441-2621-4f57b861e059@gmail.com>
Message-ID: <4255b961-bdb2-981b-0745-9a3bb5b81192@gmail.com>
Date:   Thu, 24 Oct 2019 10:59:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3363ebfc-c78a-5441-2621-4f57b861e059@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/24/19 10:57 AM, Steve Longerbeam wrote:
> Hi Laurent,
>
> This patch also looks like it needs a Fixes tag.

Fixes: 9e5fa4e1e5b5b ("media: imx7-media-csi: Use u32 for storing 
register reads")


>
>
>
> On 10/23/19 5:41 PM, Laurent Pinchart wrote:
>> The imx7_csi_dma_reflash() function starts by reading the unrelated
>> register CSI_CSICR18 to then overwrite the read value with a read from
>> register CSI_CSICR3. This is likely due to a bad copy&paste, and is not
>> needed. Remove the extraneous read from register CSI_CSICR18.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   drivers/staging/media/imx/imx7-media-csi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/imx/imx7-media-csi.c 
>> b/drivers/staging/media/imx/imx7-media-csi.c
>> index e4c9bcc045f7..ac07f55a63e3 100644
>> --- a/drivers/staging/media/imx/imx7-media-csi.c
>> +++ b/drivers/staging/media/imx/imx7-media-csi.c
>> @@ -292,7 +292,7 @@ static void imx7_csi_hw_disable(struct imx7_csi 
>> *csi)
>>     static void imx7_csi_dma_reflash(struct imx7_csi *csi)
>>   {
>> -    u32 cr3 = imx7_csi_reg_read(csi, CSI_CSICR18);
>> +    u32 cr3;
>>         cr3 = imx7_csi_reg_read(csi, CSI_CSICR3);
>>       cr3 |= BIT_DMA_REFLASH_RFF;
>

