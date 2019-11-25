Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B91B41089F8
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 09:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfKYIUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 03:20:11 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:34663 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727337AbfKYIUK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 03:20:10 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Z9bHiQTTFecrtZ9bKiHnMR; Mon, 25 Nov 2019 09:20:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574670007; bh=Cy2tmwI4YT71CWLwCNRCrtJatB4A6RrAJMVt3luR0oM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XIR7/+7OQZruZ+OJZuUnu4epmX/4pHEV94V1lQwrTkNj2e5mRfurSCf/AfytSgjNG
         4BygKpj3C1+Fbc679hCeABSJhSuPnHa9rB9xZfvywnZdEMxIIV4+i4GYv83Z/HccnQ
         H5cMqkel+SsSICgpIuHGdpLcwrPjwhtavTK78WWZmMjhZx0eZ8k80a03ryQRf/dqK1
         TbqAzsV9iTfw3E7nj3dA4QoiG8yxPaOSK9aDzrhxJ7XlXXRJsFBkH4bpPMoXu01r5q
         OFSkKsclMtNN1GE2pyMeVz9ddz3OqdBls99fxCF9wq9NmILyBVF2mRGmfa37HGge2X
         FToNrKjgzJ5Vg==
Subject: Re: [PATCH 05/10] edid-decode: output timings for YCbCr 4:2:0 cmdb
To:     Joe van Tunen <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20191123164604.268-1-joevt@shaw.ca>
 <20191123164604.268-6-joevt@shaw.ca>
 <7C871732-2189-421D-A4E1-CA6F1F972AC8@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <080daa8d-53e7-4d16-2a62-04fbbfedaf99@xs4all.nl>
Date:   Mon, 25 Nov 2019 09:20:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7C871732-2189-421D-A4E1-CA6F1F972AC8@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfEdQZUK3EnNt6zj1dC1Pbxe9xQ1nX5rF5rI+PhsgSj/lJC+c2l6KcYfh80EwCsBd4oO+ozfq2X7bM1/SSSfm1lVzj/v88ol0XfT5Juss2Dw1cF+vIgwK
 WtDTwVlgSDjr0/nmwHY3dplNxwfRlRVcno08/H+lWD8e71rTFbKB8QckStgy+eaM2uyK9OPmrITITyGXlWJO2bfI3uujN21/oBs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/25/19 7:32 AM, Joe van Tunen wrote:
> Right. The code will have to iterate EDID extension blocks, find CTA extension blocks, then find VDB blocks.
> In the case where Y420CMDB length = 0, I would maybe output "All VDB SVDs"?

Yes,

> Also, shouldn't "VSD Index" be "SVD Index" to match the abbreviations in the spec (or "VDB SVD Index" since it doesn't include SVDs from other sources such as Y420VDB)?

I think 'VBD SVDs' is correct.

>  
> Can we assume that an EDID can't use more than one Y420CMDB to get beyond VDB SVD Index 240? Each Y420CMDB will use the same set of SVDs (starting at VDB SVD index 1). The spec explicitly says that bit 0 is the first SVD of the VDBs.

I agree with that assumption.

Regards,

	Hans

>  
> On 2019-11-24, 2:26 AM, "Hans Verkuil" <hverkuil@xs4all.nl> wrote:
> 
>     On 11/23/19 5:45 PM, joevt wrote:
>     > - "YCbCr 4:2:0 capability map data block" now outputs the modes that support YCbCr 4:2:0 instead of just indexes of the modes. Indexes refer to timings in "Video Data Block".
>     > - Warnings are included in the output if "Video Data Block" doesn't appear before "YCbCr 4:2:0 Capability Map Data Block" or if the index is outside the range defined in the "Video Data Block".
>     > - Moved inner loop of cta_svd into a new function cta_svd_one so that it can be reused by cta_y420cmdb.
>     
>     This isn't sufficient. There may be multiple SVD blocks in the EDID, and that's not taken
>     into account.
>     
>     Also, I can't find any requirement in the CTA-861 spec that the YCbCr 4:2:0 Capability
>     Map Data Block has to appear after all SVD blocks. So the final check if the Y420CMDB
>     block references invalid SVDs should be postponed to the end of the CTA block.
>     
>     I also found a pre-existing bug: if length == 0 in cta_y420cmdb() then that means that
>     all SVDs support 4:2:0. That should be added to cta_y420cmdb().
>     
>     Regards,
>     
>                 Hans
>     
>     > 
>     > Signed-off-by: Joe van Tunen <joevt@shaw.ca>
>     > ---
>     >  edid-decode.c | 44 +++++++++++++++++++++++++++++++++++---------
>     >  1 file changed, 35 insertions(+), 9 deletions(-)
>     > 
>     > diff --git a/edid-decode.c b/edid-decode.c
>     > index b833178..4d6fe29 100644
>     > --- a/edid-decode.c
>     > +++ b/edid-decode.c
>     > @@ -1454,13 +1454,10 @@ static const struct edid_cta_mode *vic_to_mode(unsigned char vic)
>     >         return NULL;
>     >  }
>     >  
>     > -static void cta_svd(const unsigned char *x, unsigned n, int for_ycbcr420)
>     > +static void cta_svd_one(const unsigned char *x, int for_ycbcr420)
>     >  {
>     > -       unsigned i;
>     > -
>     > -       for (i = 0; i < n; i++)  {
>     >                         const struct edid_cta_mode *vicmode = NULL;
>     > -                       unsigned char svd = x[i];
>     > +                      unsigned char svd = x[0];
>     >                         unsigned char native;
>     >                         unsigned char vic;
>     >                         const char *mode;
>     > @@ -1468,7 +1465,7 @@ static void cta_svd(const unsigned char *x, unsigned n, int for_ycbcr420)
>     >                         unsigned clock_khz = 0;
>     >  
>     >                         if ((svd & 0x7f) == 0)
>     > -                                       continue;
>     > +                                      return;
>     >  
>     >                         if ((svd - 1) & 0x40) {
>     >                                         vic = svd;
>     > @@ -1511,10 +1508,23 @@ static void cta_svd(const unsigned char *x, unsigned n, int for_ycbcr420)
>     >                         if (vic == 1)
>     >                                         has_cta861_vic_1 = 1;
>     >         }
>     > +
>     > +static void cta_svd(const unsigned char *x, int n, int for_ycbcr420)
>     > +{
>     > +      for (unsigned i = 0; i < n; i++)  {
>     > +                      printf("    ");
>     > +                      cta_svd_one(x+i, for_ycbcr420);
>     > +                      printf("\n");
>     > +      }
>     >  }
>     >  
>     > +unsigned const char *last_cta_video_block_start = NULL;
>     > +unsigned last_cta_video_block_length = 0;
>     > +
>     >  static void cta_video_block(const unsigned char *x, unsigned length)
>     >  {
>     > +      last_cta_video_block_start = x;
>     > +      last_cta_video_block_length = length;
>     >         cta_svd(x, length, 0);
>     >  }
>     >  
>     > @@ -1531,9 +1541,25 @@ static void cta_y420cmdb(const unsigned char *x, unsigned length)
>     >                         uint8_t v = x[0 + i];
>     >                         unsigned j;
>     >  
>     > -                       for (j = 0; j < 8; j++)
>     > -                                       if (v & (1 << j))
>     > -                                                       printf("    VSD Index %u\n", i * 8 + j);
>     > +                      for (j = 0; j < 8; j++) {
>     > +                                      if (v & (1 << j)) {
>     > +                                                      unsigned k = i * 8 + j;
>     > +                                                      printf("    VSD Index %u", k + 1);
>     > +                                                      if (k >= last_cta_video_block_length) {
>     > +                                                                      if (last_cta_video_block_start) {
>     > +                                                                                      printf(" (out of range)");
>     > +                                                                      } else {
>     > +                                                                                      printf(" (missing CTA video block)");
>    > +                                                                      }
>     > +                                                      }
>     > +                                                      else
>     > +                                                      {
>     > +                                                                      printf(" ");
>     > +                                                                      cta_svd_one(last_cta_video_block_start+k, 0);
>     > +                                                      }
>     > +                                                      printf("\n");
>     > +                                      }
>     > +                      }
>     >         }
>     >  }
>     >  
>     > 
>     
>     
> 
> 

