Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4553431D7
	for <lists+linux-media@lfdr.de>; Sun, 21 Mar 2021 10:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhCUJUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 05:20:12 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:47921 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229990AbhCUJTk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 05:19:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id NuFClm1vjDUxpNuFGloHLt; Sun, 21 Mar 2021 10:19:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616318379; bh=TXLHcw1RjhUZdIV+6hnfsrc6KKPaVywI6lyplh6kE3E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=p9bWA4JeIbjaGZVw6yj93BFWiKI6pSS8S3nxmnP3oNn08i8DLVetdk7OmA4F+Jr6E
         sXUcYWlBPrhyjR/aGI0Iu10Hk7LLBBuFCg0esvHpNvfEgoFjoq9xSizSoJxp4fOJUb
         OkS+q40p2XGuXZvzruFZ2N8iG2Y6NahZ5R+D8xuxfKq8vq0BakJS5PfJ+UK5Cc97yB
         t7g6ntS0pQsfh8GjKEOZbtgN0PEhDXZCq0WP+0//BAdOBLVnXji458u5X6OdJGIu/M
         27e8oc9qpnF9l+z7wwozP766MmS63yooWFClpAYfXqQi/pXuc0sYOrLU0YmPxZP/gW
         yayx0gs8m04Ag==
Subject: Re: [PATCH] media/pci: Assign value when defining variables
To:     zuoqilin1@163.com, tskd08@gmail.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        zuoqilin <zuoqilin@yulong.com>
References: <20210317030804.963-1-zuoqilin1@163.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <47a40a03-2b54-3cb6-9314-060457794882@xs4all.nl>
Date:   Sun, 21 Mar 2021 10:19:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210317030804.963-1-zuoqilin1@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfADTQshJhCvxtZJT0gSymhgjeL5XzdNdzwlm0YKqF9rD8CxQea7wfUEDL/m3pOo008wFd+R1+TjCdzKnuk2o/7INWlFEq59EwtrxXpz45fDEULzYB8mN
 CGmQLKhLBHxq1T+Pa9z8kpLwGzRVzaYocuJpkBomAh6c9WGS96VrZim2sF1QThO26TS+rx8Qo19aFJ5a2zqz5nP+TqzCiVVWvbyR1BmNZauVguu3vD6kgyxi
 ETsFlZ7HuWbiqq30ZYR/NqrROw2f8tC10XSj8beNtAL8Hrf9rF/D6lOuh62LQECktKZpN1nRzoaKB7tkHKqhsZYA1iCTbT/v4LhboSqehZvXFNO24gtok6qP
 1tKE0zE6
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi zuoqilin,

On 17/03/2021 04:08, zuoqilin1@163.com wrote:
> From: zuoqilin <zuoqilin@yulong.com>
> 
> When defining variables and assigning values can be done at the same time.

For future reference: add the name of the driver to the prefix. Saying
'media/pci:' suggests that you patch multiple PCI drivers in that directory.
But 'media/pci/pt1:' indicates that you patch only the pt1 driver.

I've updated the subject, so no need to repost, but remember this for next
time :-)

Regards,

	Hans

> 
> Signed-off-by: zuoqilin <zuoqilin@yulong.com>
> ---
>  drivers/media/pci/pt1/pt1.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/pt1/pt1.c b/drivers/media/pci/pt1/pt1.c
> index 72b191c..f2aa368 100644
> --- a/drivers/media/pci/pt1/pt1.c
> +++ b/drivers/media/pci/pt1/pt1.c
> @@ -334,8 +334,7 @@ static int pt1_sync(struct pt1 *pt1)
>  static u64 pt1_identify(struct pt1 *pt1)
>  {
>  	int i;
> -	u64 id;
> -	id = 0;
> +	u64 id = 0;
>  	for (i = 0; i < 57; i++) {
>  		id |= (u64)(pt1_read_reg(pt1, 0) >> 30 & 1) << i;
>  		pt1_write_reg(pt1, 0, 0x00000008);
> @@ -1122,8 +1121,7 @@ static int pt1_i2c_end(struct pt1 *pt1, int addr)
>  
>  static void pt1_i2c_begin(struct pt1 *pt1, int *addrp)
>  {
> -	int addr;
> -	addr = 0;
> +	int addr = 0;
>  
>  	pt1_i2c_emit(pt1, addr,     0, 0, 1, 1, addr /* itself */);
>  	addr = addr + 1;
> 

