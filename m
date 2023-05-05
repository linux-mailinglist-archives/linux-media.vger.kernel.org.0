Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C44E56F7CE7
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 08:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbjEEGZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 02:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEEGZm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 02:25:42 -0400
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36DC11DB8
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 23:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683267928; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kHqaUHuF55dluE5U0OsUDwWeTcDVgS+mtpPEz2rP7poSJNGSk22V5VvrOBdwroX7Dq
    MRPVOj0HNHKfezFRf1aGT8VQachm+XUDTqkbNv9QhOFNqGGs25huoxmOG8fjo8OnVzg9
    qakFuY4Sv2AwH0nG2SBnRcTszW2e4Lm3a3+Vx9p/8sEgUvpTb1aO2HmvC11qbk9vN9Px
    /a2K7IkSsZ0cg7WrBAhAY8KhNuEvXdqXVwSrSQODKP0QwMH/PFB2sJsI2N++BDIx1Vlw
    HgT7eAmAHmPMhbgSLHQ2KvVIVvJW1j50+yYdXGIFkuKotI6Zd6Rd1wGdK0SOJ0P6nzMy
    z+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683267928;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=i//FUSrSGG+8+HBm12qn72qai4BTa8RnMhTs6AGCTjg=;
    b=TzBDPVakhqmHhWzaaJ14TBCvKoNHDjxzDufM//l7QePV1HGcso8dkzPMdFusZVqRPm
    hI6sarVdRft/m8HGDhdnawmJT4WdKW7kZsCbgPCAVKRAEUEVKU3lQHLToz0K2+nY8mVY
    Gxs8Df1c3Brz/wlmJFLruo8Gzid678qZXi6eH0qs0kxZ6YQGvxYemOStj5MY4hNo//Hb
    CjLQS5MNBoW8BRr90wn0QI7tQOGwiDW6LV0LXVv8F/XqOnGmVGsu21VhqL4F6ygCHCfj
    tUI+vduhCskfL5kgnaJcSJKqa3bvuf99L9f51gfBmVFMlaruQLmTTpnFdLbzi5uvWQNC
    UQXQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683267928;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=i//FUSrSGG+8+HBm12qn72qai4BTa8RnMhTs6AGCTjg=;
    b=cbBPiAcj112cs2M1TklAPOTQX4G4tpUQhj7fW9DIfPfmhuzYsrch3ma/wPt4qiUfZD
    Qxq0WEohPC1/17l29qOrdknHFMSogxJwtLB86ZUIz33lIMAjzYCsjB7D8F/u6Z186EzV
    ffZvEueWGHmxdouIv4MR/CqM3M9kiVJii9lJU5bBE+McVHnaLqA91AIXKyN6nita4wOY
    Uzapn5M62fW3wo1TcDuILnLAhNkb5NdrwrerttpQacI4hYIUtYwvfXqOzRsDn3qOeuJ1
    Vn3N7+J52cELwaD4Ej6wNUpd1Uu8wQaEzyFK1nSwSxRa1PAK8VPiYxK+fPofLoa+fyfz
    eKqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683267928;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=i//FUSrSGG+8+HBm12qn72qai4BTa8RnMhTs6AGCTjg=;
    b=eqZa4L9tl7vgjPaXqIsaDymGxf9KdvnZdiPfyEAjJ7G4WaS7Qv+nPhBDcnBsx96Skz
    QQEheYWas1j17TLRWFBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiE4ZAdALisHfRENTOMogMbqr1scA=="
Received: from [IPV6:2a02:8109:8980:4474:a839:1eae:dbf4:9f32]
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id w2b3aez456PRTKZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 5 May 2023 08:25:27 +0200 (CEST)
Message-ID: <79ea7cc5-6981-a791-7fed-7a6e27225000@xenosoft.de>
Date:   Fri, 5 May 2023 08:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [BTTV] [FSL P50x0] [PASEMI] TV Time doesn't work anymore after
 dropping the overlay support
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Darren Stevens <darren@stevens-zone.net>,
        mad skateman <madskateman@gmail.com>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>
References: <94a617be-00b3-6dc8-eb7d-ae13c6fffae5@xenosoft.de>
 <cb82b6c1-035c-cc6b-2843-6b87ed6315ac@xenosoft.de>
 <f23204ec-ff42-5907-fa28-c1975a87f4e6@xs4all.nl>
Content-Language: de-DE
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <f23204ec-ff42-5907-fa28-c1975a87f4e6@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02 May 2023 at 08:57 am, Hans Verkuil wrote:
> If v4l2-ctl fails, then try again
> after applying this series:
>
> https://patchwork.linuxtv.org/project/linux-media/cover/cover.1682995256.git.deborah.brouwer@collabora.com/
Your patch series solved the issue. Thanks a lot!
