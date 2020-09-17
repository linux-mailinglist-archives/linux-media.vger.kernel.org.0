Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1800826DA82
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 13:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgIQLk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 07:40:57 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:43285 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726691AbgIQLkj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 07:40:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IsH9kMCCGPTBMIsHCkloTy; Thu, 17 Sep 2020 13:40:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600342835; bh=LWVjGac37Swqs1c73RcC4J4x1odUo4b4exvQoq0Xu3M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fv6CV1vRszVp/PxPhA4beqW+JrLITuQO/EiomFjGrQ03poakdx6CmtVriuZ+0XUrk
         u1K+Fcqq+yjylU4ANYd44Ws1PCZzctKWy6rlYhJb2lhUkiIsIaTf4xsIEsex7Ijdxd
         j06O978+KVdQRj22SiWeolRG5FZRcTFJz6R+HywR7Grhmc719jWfSfVixJftq+j/kL
         LDzcKv6u8A3+CQk4ov25EWAAvuSKHuFeLvEQPBmQ5dfW0cCJbMiS/ZgPnTdWo3j41J
         IyN2iN+1sAb3VJCJ4sqHPGd9e4JHfl9qLN/MCnsnaQboIODqz0OzXyFTI1IkYT3tGb
         vJvGMm09WDILw==
Subject: Re: [PATCH] media: sti: Fix reference count leaks
To:     Jean-Christophe Trotin <jean-christophe.trotin@st.com>
Cc:     wu000273@umn.edu, kjlu@umn.edu,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200614033106.426-1-wu000273@umn.edu>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <013fba3b-2451-855b-08d4-87682464b8bf@xs4all.nl>
Date:   Thu, 17 Sep 2020 13:40:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200614033106.426-1-wu000273@umn.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM3bpFqPR+EtTm5o8+/bnRgoYwp8WzcqUshywS4YzCxfkHkvIriLU0YUDZ63lvtBmLSqBNOuPeZl3bzVVW/BY5dWfsGze81Q3PwM9OPLIDqIA/umFOZ5
 x4kjD1SBMlXwVNfz2mVEC4Wsa2mAkHrra4hMswyGDuGbRe9Dsc2DQlFHKTZvv/AiAx+9+Yx6d/GjwLvfhVTlEm2/2ovQ2NrI28YagBEMIfbRxruBqJTbJCnc
 nSrFsMLc/WAgJuiMdDZX34SrQAcHaI0v2fl5mreVNjRJ1leYJ0qwhZf1jO5uVAj41RIKF/yPBqGqUAStkzjQ3uVlQ8rnpdOoUb5jHNIt1cJNTLkwc3qvPHKH
 uFAztBbMo+xejJiyppBi+PRgISDP1QBvh4nmNoR8UGoCulvNY94VlZcwLZAv8wDlXqqOPnIqESCGru+0P+h03ZaPN76wDg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jean-Christophe,

I'll take this patch, but while reviewing it I noticed something else:

On 14/06/2020 05:31, wu000273@umn.edu wrote:
> From: Qiushi Wu <wu000273@umn.edu>
> 
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code, causing incorrect ref count if
> pm_runtime_put_noidle() is not called in error handling paths.
> Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.
> 
> Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> ---
>  drivers/media/platform/sti/hva/hva-hw.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/sti/hva/hva-hw.c b/drivers/media/platform/sti/hva/hva-hw.c
> index 401aaafa1710..bb13348be083 100644
> --- a/drivers/media/platform/sti/hva/hva-hw.c
> +++ b/drivers/media/platform/sti/hva/hva-hw.c
> @@ -272,6 +272,7 @@ static unsigned long int hva_hw_get_ip_version(struct hva_dev *hva)
>  
>  	if (pm_runtime_get_sync(dev) < 0) {
>  		dev_err(dev, "%s     failed to get pm_runtime\n", HVA_PREFIX);
> +		pm_runtime_put_noidle(dev);
>  		mutex_unlock(&hva->protect_mutex);

This appears to be a spurious mutex_unlock() since I don't see a corresponding mutex_lock.

Jean-Christophe, can you check this and, if I am right, post a patch fixing this?

Regards,

	Hans

>  		return -EFAULT;
>  	}
> @@ -553,6 +554,7 @@ void hva_hw_dump_regs(struct hva_dev *hva, struct seq_file *s)
>  
>  	if (pm_runtime_get_sync(dev) < 0) {
>  		seq_puts(s, "Cannot wake up IP\n");
> +		pm_runtime_put_noidle(dev);
>  		mutex_unlock(&hva->protect_mutex);
>  		return;
>  	}
> 

