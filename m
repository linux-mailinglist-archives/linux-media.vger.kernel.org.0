Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2623F18CF69
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 14:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgCTNuR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 09:50:17 -0400
Received: from gofer.mess.org ([88.97.38.141]:58203 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726666AbgCTNuQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 09:50:16 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CF719C635F; Fri, 20 Mar 2020 13:50:15 +0000 (GMT)
Date:   Fri, 20 Mar 2020 13:50:15 +0000
From:   Sean Young <sean@mess.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: siano: Use scnprintf() for avoiding potential
 buffer overflow
Message-ID: <20200320135015.GB21882@gofer.mess.org>
References: <20200311074638.8572-1-tiwai@suse.de>
 <s5ha74cuyl3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5ha74cuyl3.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 19, 2020 at 04:57:28PM +0100, Takashi Iwai wrote:
> On Wed, 11 Mar 2020 08:46:38 +0100,
> Takashi Iwai wrote:
> > 
> > Since snprintf() returns the would-be-output size instead of the
> > actual output size, the succeeding calls may go beyond the given
> > buffer limit.  Fix it by replacing with scnprintf().
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> A gentle reminder for this forgotten patch.
> Let me know if any further changes are needed.

Thank you for your reminder. The changes look good, unfortunately they
missed the deadline for v5.7. I handle them after the next merge window.

Thanks,

Sean

> 
> 
> thanks,
> 
> Takashi
> 
> > ---
> >  drivers/media/common/siano/smsdvb-debugfs.c | 208 ++++++++++++++--------------
> >  1 file changed, 104 insertions(+), 104 deletions(-)
> > 
> > diff --git a/drivers/media/common/siano/smsdvb-debugfs.c b/drivers/media/common/siano/smsdvb-debugfs.c
> > index c95d4583498e..e624028198da 100644
> > --- a/drivers/media/common/siano/smsdvb-debugfs.c
> > +++ b/drivers/media/common/siano/smsdvb-debugfs.c
> > @@ -45,88 +45,88 @@ static void smsdvb_print_dvb_stats(struct smsdvb_debugfs *debug_data,
> >  
> >  	buf = debug_data->stats_data;
> >  
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "is_rf_locked = %d\n", p->is_rf_locked);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "is_demod_locked = %d\n", p->is_demod_locked);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "is_external_lna_on = %d\n", p->is_external_lna_on);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "SNR = %d\n", p->SNR);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "ber = %d\n", p->ber);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "FIB_CRC = %d\n", p->FIB_CRC);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "ts_per = %d\n", p->ts_per);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "MFER = %d\n", p->MFER);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "RSSI = %d\n", p->RSSI);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "in_band_pwr = %d\n", p->in_band_pwr);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "carrier_offset = %d\n", p->carrier_offset);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "modem_state = %d\n", p->modem_state);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "frequency = %d\n", p->frequency);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "bandwidth = %d\n", p->bandwidth);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "transmission_mode = %d\n", p->transmission_mode);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "modem_state = %d\n", p->modem_state);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "guard_interval = %d\n", p->guard_interval);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "code_rate = %d\n", p->code_rate);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "lp_code_rate = %d\n", p->lp_code_rate);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "hierarchy = %d\n", p->hierarchy);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "constellation = %d\n", p->constellation);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "burst_size = %d\n", p->burst_size);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "burst_duration = %d\n", p->burst_duration);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "burst_cycle_time = %d\n", p->burst_cycle_time);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "calc_burst_cycle_time = %d\n",
> >  		      p->calc_burst_cycle_time);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "num_of_rows = %d\n", p->num_of_rows);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "num_of_padd_cols = %d\n", p->num_of_padd_cols);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "num_of_punct_cols = %d\n", p->num_of_punct_cols);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "error_ts_packets = %d\n", p->error_ts_packets);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "total_ts_packets = %d\n", p->total_ts_packets);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "num_of_valid_mpe_tlbs = %d\n", p->num_of_valid_mpe_tlbs);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "num_of_invalid_mpe_tlbs = %d\n", p->num_of_invalid_mpe_tlbs);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "num_of_corrected_mpe_tlbs = %d\n", p->num_of_corrected_mpe_tlbs);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "ber_error_count = %d\n", p->ber_error_count);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "ber_bit_count = %d\n", p->ber_bit_count);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "sms_to_host_tx_errors = %d\n", p->sms_to_host_tx_errors);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "pre_ber = %d\n", p->pre_ber);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "cell_id = %d\n", p->cell_id);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "dvbh_srv_ind_hp = %d\n", p->dvbh_srv_ind_hp);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "dvbh_srv_ind_lp = %d\n", p->dvbh_srv_ind_lp);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "num_mpe_received = %d\n", p->num_mpe_received);
> >  
> >  	debug_data->stats_count = n;
> > @@ -148,42 +148,42 @@ static void smsdvb_print_isdb_stats(struct smsdvb_debugfs *debug_data,
> >  
> >  	buf = debug_data->stats_data;
> >  
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "statistics_type = %d\t", p->statistics_type);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "full_size = %d\n", p->full_size);
> >  
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "is_rf_locked = %d\t\t", p->is_rf_locked);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "is_demod_locked = %d\t", p->is_demod_locked);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "is_external_lna_on = %d\n", p->is_external_lna_on);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "SNR = %d dB\t\t", p->SNR);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "RSSI = %d dBm\t\t", p->RSSI);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "in_band_pwr = %d dBm\n", p->in_band_pwr);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "carrier_offset = %d\t", p->carrier_offset);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "bandwidth = %d\t\t", p->bandwidth);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "frequency = %d Hz\n", p->frequency);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "transmission_mode = %d\t", p->transmission_mode);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "modem_state = %d\t\t", p->modem_state);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "guard_interval = %d\n", p->guard_interval);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "system_type = %d\t\t", p->system_type);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "partial_reception = %d\t", p->partial_reception);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "num_of_layers = %d\n", p->num_of_layers);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "sms_to_host_tx_errors = %d\n", p->sms_to_host_tx_errors);
> >  
> >  	for (i = 0; i < 3; i++) {
> > @@ -191,31 +191,31 @@ static void smsdvb_print_isdb_stats(struct smsdvb_debugfs *debug_data,
> >  		    p->layer_info[i].number_of_segments > 13)
> >  			continue;
> >  
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\nLayer %d\n", i);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\tcode_rate = %d\t",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\nLayer %d\n", i);
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\tcode_rate = %d\t",
> >  			      p->layer_info[i].code_rate);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "constellation = %d\n",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "constellation = %d\n",
> >  			      p->layer_info[i].constellation);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\tber = %-5d\t",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\tber = %-5d\t",
> >  			      p->layer_info[i].ber);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\tber_error_count = %-5d\t",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\tber_error_count = %-5d\t",
> >  			      p->layer_info[i].ber_error_count);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "ber_bit_count = %-5d\n",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "ber_bit_count = %-5d\n",
> >  			      p->layer_info[i].ber_bit_count);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\tpre_ber = %-5d\t",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\tpre_ber = %-5d\t",
> >  			      p->layer_info[i].pre_ber);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\tts_per = %-5d\n",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\tts_per = %-5d\n",
> >  			      p->layer_info[i].ts_per);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\terror_ts_packets = %-5d\t",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\terror_ts_packets = %-5d\t",
> >  			      p->layer_info[i].error_ts_packets);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "total_ts_packets = %-5d\t",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "total_ts_packets = %-5d\t",
> >  			      p->layer_info[i].total_ts_packets);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "ti_ldepth_i = %d\n",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "ti_ldepth_i = %d\n",
> >  			      p->layer_info[i].ti_ldepth_i);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n,
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  			      "\tnumber_of_segments = %d\t",
> >  			      p->layer_info[i].number_of_segments);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "tmcc_errors = %d\n",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "tmcc_errors = %d\n",
> >  			      p->layer_info[i].tmcc_errors);
> >  	}
> >  
> > @@ -238,44 +238,44 @@ static void smsdvb_print_isdb_stats_ex(struct smsdvb_debugfs *debug_data,
> >  
> >  	buf = debug_data->stats_data;
> >  
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "statistics_type = %d\t", p->statistics_type);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "full_size = %d\n", p->full_size);
> >  
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "is_rf_locked = %d\t\t", p->is_rf_locked);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "is_demod_locked = %d\t", p->is_demod_locked);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "is_external_lna_on = %d\n", p->is_external_lna_on);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "SNR = %d dB\t\t", p->SNR);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "RSSI = %d dBm\t\t", p->RSSI);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "in_band_pwr = %d dBm\n", p->in_band_pwr);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "carrier_offset = %d\t", p->carrier_offset);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "bandwidth = %d\t\t", p->bandwidth);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "frequency = %d Hz\n", p->frequency);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "transmission_mode = %d\t", p->transmission_mode);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "modem_state = %d\t\t", p->modem_state);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "guard_interval = %d\n", p->guard_interval);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "system_type = %d\t\t", p->system_type);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "partial_reception = %d\t", p->partial_reception);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n,
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  		      "num_of_layers = %d\n", p->num_of_layers);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n, "segment_number = %d\t",
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n, "segment_number = %d\t",
> >  		      p->segment_number);
> > -	n += snprintf(&buf[n], PAGE_SIZE - n, "tune_bw = %d\n",
> > +	n += scnprintf(&buf[n], PAGE_SIZE - n, "tune_bw = %d\n",
> >  		      p->tune_bw);
> >  
> >  	for (i = 0; i < 3; i++) {
> > @@ -283,31 +283,31 @@ static void smsdvb_print_isdb_stats_ex(struct smsdvb_debugfs *debug_data,
> >  		    p->layer_info[i].number_of_segments > 13)
> >  			continue;
> >  
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\nLayer %d\n", i);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\tcode_rate = %d\t",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\nLayer %d\n", i);
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\tcode_rate = %d\t",
> >  			      p->layer_info[i].code_rate);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "constellation = %d\n",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "constellation = %d\n",
> >  			      p->layer_info[i].constellation);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\tber = %-5d\t",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\tber = %-5d\t",
> >  			      p->layer_info[i].ber);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\tber_error_count = %-5d\t",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\tber_error_count = %-5d\t",
> >  			      p->layer_info[i].ber_error_count);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "ber_bit_count = %-5d\n",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "ber_bit_count = %-5d\n",
> >  			      p->layer_info[i].ber_bit_count);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\tpre_ber = %-5d\t",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\tpre_ber = %-5d\t",
> >  			      p->layer_info[i].pre_ber);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\tts_per = %-5d\n",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\tts_per = %-5d\n",
> >  			      p->layer_info[i].ts_per);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "\terror_ts_packets = %-5d\t",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "\terror_ts_packets = %-5d\t",
> >  			      p->layer_info[i].error_ts_packets);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "total_ts_packets = %-5d\t",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "total_ts_packets = %-5d\t",
> >  			      p->layer_info[i].total_ts_packets);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "ti_ldepth_i = %d\n",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "ti_ldepth_i = %d\n",
> >  			      p->layer_info[i].ti_ldepth_i);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n,
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n,
> >  			      "\tnumber_of_segments = %d\t",
> >  			      p->layer_info[i].number_of_segments);
> > -		n += snprintf(&buf[n], PAGE_SIZE - n, "tmcc_errors = %d\n",
> > +		n += scnprintf(&buf[n], PAGE_SIZE - n, "tmcc_errors = %d\n",
> >  			      p->layer_info[i].tmcc_errors);
> >  	}
> >  
> > -- 
> > 2.16.4
> > 
