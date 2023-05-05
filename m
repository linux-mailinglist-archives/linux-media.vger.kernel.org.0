Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC246F7DAB
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 09:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbjEEHUn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 03:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjEEHUm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 03:20:42 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFED16360
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 00:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683271227; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YE+ew5QJayeRIKnLU63eAj4k4Ek9YP0Qrk3I+tDd4idxB+GwXPhcyS4FuDpZhUcLMU
    8+6jP1CGQUqXuvhtyLxN2bXcmsqPmh0RmDcOOQrutZdkmeiIAMZISQ/IrAUVW4PBQUtL
    G7aUUbjsQleP2+M/Y0s5JNGIwy/b/myBWdYOcDRpxAcgrZRKLyfDjJZ+5PtsLt6iOe+l
    FFcXUDT/JI1A/pLa6qhkt3yPuunCyMLHw8VdBUlDr2qCmIoIK3sLsIsEJK7PzvY5uCiH
    ZBjoD3eVZ5HUGy/TDUhzR91qVzTW7AlDjW2QgWep7GTGLJQ/90kXKLXP6Z65ijCi9FLT
    5X8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683271227;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=egwt1sx6IgrtH3RKiZ9E7zbtBvQ6cIdQkgeQuFof3Hc=;
    b=eJIA3y2gQuOb5y1FXZJhdn7gWe/FRe977uDzgMQCpSK8F3/MZ/3+B/eUhXAaVvaq2I
    OWH9b8VZsqhKyWC0TH5yk8cW31Fz6XnzYmS0a2FKeIQMdnWYNKjq85+bl59Y8MZ6sSJ0
    cXZBUzrWQrsuqNfM2ptbIx+xmk7e2BEKaakicyrDJcEiAH93ymXUK1KNP222m6hJZeTo
    TKI6QYRPxKhVdYYWmR3jPUmoiSJCLzoPOK5cr8E5zrzZwjauhouLoz7wi8xSE4rjdXvg
    v47FyM79XTbtoQhXMbPcN0s4TxuL5b3+8I+GHPYJFolZiv9+Ju7WEuCOH7yo0yYEffBy
    +htA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683271227;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=egwt1sx6IgrtH3RKiZ9E7zbtBvQ6cIdQkgeQuFof3Hc=;
    b=WBEm+UR8HArPs6FKZjvs7NSJjab5wFxggqpQ1faVG5mB7rZiiBhfqP3G1Ft36SYSNY
    7ie0ME3zyCwgq9kap84CX+ZvZdhOy5zNLG/0V0MGHwVN4MiJOeA5mjj/+ZcZKtdlwl6c
    kMeeQQ7aThPSa3bkl+t7eaytehKH4dOCEvmDCb/3UlRgEhIVOfPK0dk7cAuU/sGZ1/uF
    6Q2asct76luXQ+xJU42LnpjrN/fh54sstfFFnE1cvHEVsmB7GLEVQQLb9EqhyqKawcjF
    UNw7U8f3tK/4tZl8wO8tV18AnRk+27P5jjZW83/iXVlCFsuDn9gQeGnjzYWpSRb62Itk
    KECQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683271227;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=egwt1sx6IgrtH3RKiZ9E7zbtBvQ6cIdQkgeQuFof3Hc=;
    b=w/t/MsP7pz9vB+kkNPFACl2uTWZMB7h761K8vxj/q6QvZS/4uPk2Zzg6sRtXsOSWZ4
    66pdNbqacUnqzEidt2DA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiE4ZAdALisHfRENTOMogMbqr1scA=="
Received: from [IPV6:2a02:8109:8980:4474:a839:1eae:dbf4:9f32]
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id w2b3aez457KQTbz
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 5 May 2023 09:20:26 +0200 (CEST)
Message-ID: <82799d05-db42-c6a3-51ef-15e262344d4f@xenosoft.de>
Date:   Fri, 5 May 2023 09:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [BTTV] [FSL P50x0] [PASEMI] TV Time doesn't work anymore after
 dropping the overlay support
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Darren Stevens <darren@stevens-zone.net>,
        mad skateman <madskateman@gmail.com>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
References: <94a617be-00b3-6dc8-eb7d-ae13c6fffae5@xenosoft.de>
 <cb82b6c1-035c-cc6b-2843-6b87ed6315ac@xenosoft.de>
 <f23204ec-ff42-5907-fa28-c1975a87f4e6@xs4all.nl>
 <79ea7cc5-6981-a791-7fed-7a6e27225000@xenosoft.de>
 <a02d481b-562c-803a-a71d-b8d95ba7ebb5@xs4all.nl>
Content-Language: de-DE
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <a02d481b-562c-803a-a71d-b8d95ba7ebb5@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05 May 2023 at 08:45 am, Hans Verkuil wrote:
> On 05/05/2023 08:25, Christian Zigotzky wrote:
>> On 02 May 2023 at 08:57 am, Hans Verkuil wrote:
>>> If v4l2-ctl fails, then try again
>>> after applying this series:
>>>
>>> https://patchwork.linuxtv.org/project/linux-media/cover/cover.1682995256.git.deborah.brouwer@collabora.com/
>> Your patch series solved the issue. Thanks a lot!
> Nice, but somewhat unexpected :-)
>
> I'm a little bit unsure how to proceed: the 6.4 kernel will remove destructive overlay
> support, but it won't have this series yet, that's for 6.5. But that would make 6.4
> unusable for you.
>
> I might have to revert the overlay removal, at least for bttv.
>
> Regards,
>
> 	Hans
Hans,

You don't need to revert the overlay removal because your patch series 
work with the latest git kernel (6.4).

Thanks for your help,

Christian
