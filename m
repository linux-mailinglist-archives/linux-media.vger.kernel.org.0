Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1AC352213C
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 18:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244402AbiEJQe2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 12:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347379AbiEJQeJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 12:34:09 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B0D205448
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 09:30:10 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dwlsalmeida)
        with ESMTPSA id 8675F1F4483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1652200209;
        bh=CcKfuSoBOZW6f+0Otg/oTVbsFsOkmlHqVzweOWV3VzE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=IOTri/gSmEmyxd2Ma/p22SeT5LPNMVSGoUxeiyNyt+2pqiIWX6LVVfyn4rJiiS5VH
         uOurq6meKOI07qpKZDHUZYQ51AU+dTfL+kozXX4NRt6mHbMHs837aLZSxTEKruu1+d
         H6U1+fCtt4jcPLSkJBHXFH0O91StBRdK+rg50jOfdjgb3mGuWC5BouzpJ2zROJi5Ts
         e/aP5EAT49dqGRX8WAKBzFfeOUiDNB6OEI08UMvQzBdFq3JLSI1rfmKN37ERXD+vZJ
         YBPp4xH5CI+XJzos9VlF3CXw5iZN5X23KNs2YnKzf1ic0zxPoFuh6SQmQfF13vyNFN
         R8lOIX3iE+9nw==
Message-ID: <fa87fd58-dc73-24b0-0425-e466062c1d6d@collabora.com>
Date:   Tue, 10 May 2022 13:30:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v2] media: Add AV1 uAPI
Content-Language: en-US
To:     Steve Cho <stevecho@chromium.org>
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Steve Cho <stevecho@chromium.org>
References: <20220322160101.620748-1-daniel.almeida@collabora.com>
 <CAC-pXoOQ5kD4bT95j+pwi7+Hb5s5H=0LFhAsk7K2sM9LkbAW1w@mail.gmail.com>
From:   Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAC-pXoOQ5kD4bT95j+pwi7+Hb5s5H=0LFhAsk7K2sM9LkbAW1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

> Hi Daniel,
>
> Found a minor typo.
>
>> See enum_v4l2_av1_frame_restoration_type.
> Assume you meant v4l2_av1_frame_restoration_type instead here.


Thanks for the heads up, this will be fixed in v3.

-- Daniel

