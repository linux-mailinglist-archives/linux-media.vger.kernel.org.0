Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94BA83734F1
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 08:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbhEEG2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 02:28:11 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:52685 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231633AbhEEG2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 02:28:11 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 019AC1470;
        Wed,  5 May 2021 02:27:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 05 May 2021 02:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=E1bMRh3YyxIAvDf7EAz+oOfqzWIdjLND5FkkcPstI
        7A=; b=NHycgAkrF6qL1LGUnqAkzinK5ogiof0EHk4MCHJAMLCE8HyiSKOOw1/n1
        E4DQz3LNrpYSzh99VSyB9rAhLhmgIghCD24Gg06Eisl9He2/w9rwtbdXHwKOidX3
        IyxHAS6EJ6qb4o4n9MergQefTnvOeEPKtJIlI0Q8RIcQL8e3rLFJqjAB+XjLd7+I
        y4e7dAi/GJbpMXxlnH834id4OkkQLgRhUeDh9Bl9VCcyh/+vIKiQd/orPgUMe+PZ
        sQl88M9ZIrX81nj8Bun6vZ8yzF9xDUEPztRM2V59x8QEQ6H2jhYV6jMr7JbFh7F1
        IOq94G/Cy0NU0uZI3XWePQ7FFJaHg==
X-ME-Sender: <xms:wjqSYFVZCDtksDLdLgiEwMJuKN9oXXIguzJ-rFdNLP2jwub9Byb_Kg>
    <xme:wjqSYFmDIvv2Shen5C3uYUP62aSCAqERewF2lZ8yuGugzcuG1wt-mSLaOxho0kylM
    ynuzvGUlrN0VeP-Ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefjedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefgughg
    rghrucfvhhhivghruceoihhnfhhosegvughgrghrthhhihgvrhdrnhgvtheqnecuggftrf
    grthhtvghrnhepkefhleevjeeivdehffdtffefieejueekhedtleekueeujeehkeduieeg
    kedufffgnecukfhppeefuddrvddtledrleehrddvgedvnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepihhnfhhosegvughgrghrthhhihgvrhdr
    nhgvth
X-ME-Proxy: <xmx:wjqSYBY7ICurj1zjpE01cdZihdhGjHMPSChpzWyjrwFxL5ULLZqDeQ>
    <xmx:wjqSYIVY-iKxblmq8TRWWj5dxZUqIqtBw0DFqAXHnGiLL5ZQt12raQ>
    <xmx:wjqSYPny_vyL1rCL9dQoKU_cInpENz5lnc_xpB424WrJiiIqVFFPfQ>
    <xmx:wjqSYFRoqIFco12DJ-prmrbq9QLF6Hq925wWvAgvQvBNBJYaHn6_0A>
Received: from [192.168.0.125] (unknown [31.209.95.242])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Wed,  5 May 2021 02:27:13 -0400 (EDT)
Subject: Re: [PATCH v2 1/2] v4l: Add 12-bit raw bayer linear packed formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     sakari.ailus@iki.fi,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20190708060225.5172-1-info@edgarthier.net>
 <YFib1BNtNYSp2m7W@pendragon.ideasonboard.com>
From:   Edgar Thier <info@edgarthier.net>
Message-ID: <d684723c-aab8-e6e1-7077-89560232e132@edgarthier.net>
Date:   Wed, 5 May 2021 08:27:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YFib1BNtNYSp2m7W@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

My apologies for the late reply.

> no need to resubmit this patch if you agree with the proposed
> changes, I'll apply them locally.

Feel free to apply them locally.

Regards,

Edgar
