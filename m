Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7C227246A
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 14:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgIUM51 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 08:57:27 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:33074 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726355AbgIUM50 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 08:57:26 -0400
X-Greylist: delayed 307 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 08:57:24 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600693046; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=eGPAEVHied9ipPQzc+EA5SSxuprSpzOxnsDeoTsKKhs=;
 b=JlobVP7KdKSqUP2YE12RkS/EPFfXxWe2ZvNq3sRIbDh6lhacXsk2eep2YVpRvo93IeScV7MQ
 iqLczihEUKjPkS+Lk673ZRXdgOBcH05bGsct9xuMUrJH+HbgfXqZnaJOitzlXZiwYedKgNGL
 rm7STKLHweZvO/Vj5vsKBH26YJI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f68a1fc0049ea5816e0969d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Sep 2020 12:52:12
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 13117C433CA; Mon, 21 Sep 2020 12:52:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9AC6CC433C8;
        Mon, 21 Sep 2020 12:52:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 21 Sep 2020 18:22:11 +0530
From:   dikshita@codeaurora.org
To:     Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com,
        stanimir.varbanov@linaro.org, vgarodia@codeaurora.org,
        majja@codeaurora.org
Subject: Re: [PATCH 0/2] Add new controls for QP and layer bitrate
In-Reply-To: <1600692113-32279-1-git-send-email-dikshita@qti.qualcomm.com>
References: <1600692113-32279-1-git-send-email-dikshita@qti.qualcomm.com>
Message-ID: <fc38f7871a52b66f388a5345714e6480@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Kindly ignore this patch series. Will be posting a new one.

Thanks,
Dikshita

On 2020-09-21 18:11, Dikshita Agarwal wrote:
> This series adds frame specific min/max qp controls for hevc and
> layer wise bitrate control for h264.
> 
> Dikshita Agarwal (2):
>   media: v4l2-ctrl: Add frame-specific min/max qp controls for hevc
>   media: v4l2-ctrl: Add layer wise bitrate controls for h264
> 
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 74 
> +++++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls.c               | 15 +++++
>  include/uapi/linux/v4l2-controls.h                 | 17 +++++
>  3 files changed, 104 insertions(+), 2 deletions(-)
